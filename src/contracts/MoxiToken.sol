// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";

contract MoxiToken is ERC20 {
  using SafeMath for uint256;
  
  event DividendIssued(address indexed paidBy, uint256 amount);
  event Withdrawn(address indexed by, uint256 amount);
  
  IERC20 baseToken;
  
  struct Owed {
      uint256 outstanding; // total outstanding additonal balance
      uint256 paidFrom; // amount of addition balance paid from
  }

  mapping (address => Owed) internal owed;
  uint256 private total_;
  uint256 private baseTotal_;

  uint256 private outstandingPrincipal_;

  constructor(string memory name, string memory symbol)
      ERC20(name, symbol) {
  }

  function issueDividend() public returns (bool) {
      // req

      // calculate amount
      uint256 dividendAmount = baseToken.balanceOf(address(this)) -
          outstandingPrincipal_;

      if (dividendAmount > 0) {
          _addDividend(dividendAmount);
      }

      emit DividendIssued(msg.sender, dividendAmount);

      return true;
  }

  function transferFrom(address _from, address _to, uint256 _value)
      public override returns (bool) {
      _updateOwed(_from);
      _updateOwed(_to);
      return super.transferFrom(_from, _to, _value);
  }

  function transfer(address _to, uint256 _value) public override returns (bool) {
      _updateOwed(msg.sender);
      _updateOwed(_to);
      return super.transfer(_to, _value);
  }

  function owedTo(address _holder) public view returns (uint256) {
      if (total_ == 0) return 0;
      uint addition = total_
          .sub(owed[_holder].paidFrom)
          .mul(balanceOf(_holder))
          .div(baseTotal_);
      return owed[_holder].outstanding + addition;
  }

  function withdraw() public returns (uint256) {
      uint amount = _withdrawFor(msg.sender);
      emit Withdrawn(msg.sender, amount);
      return amount;
  }

  function _withdrawFor(address _payee) internal returns (uint256) {
      _updateOwed(_payee);
      uint outstanding = owed[_payee].outstanding;
      if (outstanding > 0) {
          owed[_payee].outstanding = 0;
          baseToken.transfer(_payee, outstanding);
      }
      return outstanding;
  }

  function _addDividend(uint256 amount) internal {
      require(totalSupply() > 0, "MoxiToken: no tokens to issue dividend to");

      if (total_ == 0 && baseTotal_ == 0) {
          baseTotal_ = totalSupply();
      }

      if (totalSupply() == baseTotal_) {
          total_ += amount;
      } else {
          uint adjusted = amount.mul(baseTotal_).div(totalSupply());
          total_ += adjusted;
      }
  }

  function _updateOwed(address _for) internal {
      if (owed[_for].paidFrom < total_) {
          uint addition = total_
              .sub(owed[_for].paidFrom)
              .mul(balanceOf(_for))
              .div(baseTotal_);
          owed[_for].outstanding += addition;
          owed[_for].paidFrom = total_;
      }
  }
}
