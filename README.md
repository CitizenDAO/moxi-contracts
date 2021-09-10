
# Moxi Contracts Development Framework

**Problem:** Health insurance is expensive to buy & confusing to use. 

**Solution:** Use programmable money and chatbots to automate the health insurance industry away.

**Project:** Moxi is a decentralized health insurance protocol governed by Citizen DAO. 


## Moxi helps you:

**Save** for future healthcare expenses with a crypto-native savings account earning 10-20% APY. 

**Share** expensive medical bills with the Citizen Health Fund. All members contribute, all members get help.

**Finance** medical services, procedures, and products outside the sharing fund.


## How it works

- Instead of paying for an insurance policy, you deposit DAI or USDC in a collective pool earning APY. 
- Collective stable currency is then lent out on Yearn, Aave, Sushi, & other yielding sources to generate the APY.
- The collective pool is a loose fork of PoolTogether, but instead of weekly prizes, the interest earned pays the fund’s medical bills.
- You can select how much financial coverage you want on the most common medical situations. v1 plan starts with cancer, heart attack, stroke, COVID-19, & freak accident.
- You continue saving for future health expenses while earning compounding interest in CDAO (Citizen DAO native token) and other DAO tokens staked in the treasury pool. 
- APY is based on your amount staked and daily health score calculated from steps, activity, & sleep.
- If you unfortunately experience one of the medical events, the pool pays the bill from the interest earned. Take a picture of your bill and send it to Moxi the bot. Moxi will verify within 10 seconds and deposit the amount on your Moxi Visa card programmed with Circle. 
- At any point, you can withdraw deposits and a portion of interest earned.


**Here are some important resources:**

- We communicate on [Discord](https://discord.gg/SVKqEmrnM4)
- Our designs are on [Figma](https://www.figma.com/file/XC2i0AE6c3SN96w5eHLihW/Moxi-Dashboard-Designs)
- Moxi is the first $Health project from [Citizen DAO](https://citizendao.com)  

## Development

### Running Dev Environment

Use the command
```bash
> ./cmd/launch dev -c
```
to run the compile and migrate contracts to a test network. In lieu of a sensible *nix environment, run the command through python
```bash
> python3 /cmd/launch
```
the following flags are available:

- -c - launch the truffle development console
- -s - launch a shell environment
- -b - rebuild the docker images
- -h - help output

### Contributing

We encourage a [triangle workflow](https://gist.github.com/anjohnson/8994c95ab2a06f7d2339) for development, with pull requests going directly onto the main branch; essentially a [github flow](https://guides.github.com/introduction/flow/) model.

### Requirements



## Maintainers

@BrennenHodge
@james-c
@Amirjab21
@corddry
@PradhumnaPancholi

## Tech


### Dependencies
We will make the dev environment Docker-based for consistency / ease-of-use, so requirements for use should be limited to:

* Docker (make sure it's a latest or very recent release)
* Python 3 (for scripting)

And of course Moxi itself is open source under a MIT license.

## Moxi API
