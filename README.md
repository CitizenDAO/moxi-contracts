# Moxi Contracts Development Framework

Health insurance is expensive to buy, confusing to use, and doesn't align with the crypto world.

Our solution is Moxi - a shared health insurance protocol governed by a DAO.

Moxi consists of three core components:

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


Development - How To Contribute
---

*Edit this*

Please always branch off of `develop`, all branches should be named based on
a corresponding issue number, for example `issue-126`. All open issues can be
viewed [here](https://github.com/CitizenHealth/COVIDx/issues). If you're working
on a bug fix or new functionality not already listed in an issue, you must first
create a new issue to document what you will be working on.

Please be sure to use `yarn` as your package manager *instead* of `npm`.

1. Clone our github repo, once you've been added to the project
2. Run: `yarn install`
3. Checkout to your issue branch
4. Create a local .env file; you can use the .env.sample file as a guide.
5. Reach out to a maintainer for the Firebase and Tripetto API keys.
6. Run `yarn start`, after an initial load it should auto-open http://localhost:3000/
7. Develop and test your code changes, it should livereload out of the box
8. Make sure you commit changes often, with clear commit messages
9. Send a pull request

## Build & Deployment from scratch
Pre-requisite: Be added to the Firebase project if not already

1. Clone github repo
2. Run: yarn install
3. Run: yarn deploy

## Maintainers

@BrennenHodge
@james-c
@Amirjab21
@corddry
@PradhumnaPancholi

## Tech


### Dependencies
Moxi uses a number of open source projects to work properly:

* [React](https://reactjs.org/) - for our frontend
* Add more

And of course Moxi itself is open source under a MIT license.

## Moxi API




