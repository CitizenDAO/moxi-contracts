// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";
import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract MoxiPool is AccessControlEnumerable {

    using EnumerableSet for EnumerableSet.AddressSet;
    using Counters for Counters.Counter;
    
    // roles

    bytes32 public constant GOVERNANCE_ROLE = keccak256("GOVERNANCE_ROLE");

    // claim categories

    enum ClaimType {
                    CANCER,
                    HEART_DISEASE,
                    ACCIDENT
    }

    struct Claim {
        address claimee;
        ClaimType type;
        bool verified;
        bool rejected;
        bool claimed;
    }

    mapping (uint256 => Claim) public claims;s
    Counters.Counter private claimCounter;

    // currency

    IERC20 public inputToken;

    // membership cost
    uint256 membershipCost;

    // payout amounts

    mapping (ClaimType => uint256) public maxPayouts;

    // payment in destinations

    EnumerableSet.AddressSet private destinations;
    mapping (address => uint256) private destinationWeightings;
    address public witdrawalAddress;
    
    // benefits calculations

    mapping (address => uint256) public membershipStart;
    mapping (address => uint256) public latestPayment;

    modifier onlyGovernors() {
        require (hasRole(GOVERNANCE_ROLE, msg.sender));
        _;
    }

    modifier onlyMembers() {
        require (_isMember(msg.sender));
        _;
    }


    constructor(address inputToken_) {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        inputToken = IERC20(inputToken_);
    }
    
    // governance

    function setDestinationWeight(address from,
                                  uint256 weight)
        public onlyGovernors returns (bool) {

        if (weight == 0) {
            EnumerableSet.remove(destinations, from);
            return true;
        }
        
        if (!EnumerableSet.contains(destinations, from)) {
            EnumerableSet.add(destinations, from);
        }
        destinationWeightings[address] = weight;
        return true;
    }

    function setMaxPayout (ClaimType type, uint256 maxPayout)
        public onlyGovernors returns (bool) {
        maxPayouts[type] = maxPayout;
        return true;
    }

    function getMaxPayout (ClaimType type) public view returns (uint256) {
        return maxPayouts[type];
    }
    
    // payments in

    function _getCurrentPeriod() public view returns (uint256) {
        return block.number / 200000; // about a month, will do for now
    }

    function deposit() public onlyMembers returns (bool) {
        // fixed deposit amount for now
        uint256 amount = membershipCost;
        uint256 period = _getCurrentPeriod();
        
        // require membership

        // pay once a month
        require (latestPayment[msg.sender] < period);
        
        // update membership
        
        if (latestPayment[msg.sender] == period - 1) {
            //membership is up-to-date
            latestPayment[msg.sender] = period;
        } else {
            // (re)start membership
            latestPayment[msg.sender] = period;
            membershipStart = period;
        }
        
        require (inputToken.allowance(msg.sender, address(this)) <= amount,
                 "MoxiPool: deposit amount over allowance");
        
        require (inputToken.transferFrom(msg.sender, address(this), amount),
                 "MoxiPool: token transfer failed");

        // distribute input
        
        // mint tokens
        
        return true;
    }

    // claims

    function makeClaim(ClaimType type) public onlyMembers returns (bool) {
        // construct claim
        uint256 id = claimCounter.current();

        claims[id].claimee = msg.sender;
        claims[id].type = type;

        return true;
    }

    function verifyClaim(uint256 claimId) public onlyGovernors returns (bool) {
        require (claimId < claimCounter.current());
        require (!claims[claimId].claimed);
        claims[claimId].verified = true;
        return true;
    }

    function rejectClaim(uint256 claimId) public onlyGovernors returns (bool) {
        require (claimId < claimCounter.current());
        require (!claims[claimId].claimed);
        claims[claimId].rejected = true;
        return true;
    }

    // payments out

    function collectClaim(uint256 claimId) public onlyMembers returns (bool) {
        require (claimId < claimCounter.current());
        Claim claim = claims[claimId];
        require (claim.verified && !claim.rejected && !claim.claimed);

        // minimum token amount??

        // transfer from claims pool

        return true;
        
    }

    function _calculateClaimValue(uint256 claimId) internal returns (uint256) {
    }

    function _isMember(address user) public view returns (bool) {
    }

}
