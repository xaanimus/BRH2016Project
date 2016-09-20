# FRONTEND

## Login Screen
- [ ] UI (textfields for email, password, sign up button)
- [ ] Initiate a new connection object stored in the AppDelegate

## Sign Up Screen
- [ ] Send sign up request for new user
- [ ] Display success (return to login screen) or failure

## Tip Screen

## Home / Leaderboard
- [ ] Graph of your spending
- [ ] Last week spending
- [ ] input data button
- [ ] Youre spending x more than average person in a 200 mile radius
- [ ] Top 10 users in 200 mile radius

## Input Data

## Survey (might skip this)

## Connection Functionality
- [x] init() throws
- [x] type Dollar
- [x] func moneySpentLastWeek() -> Dollar?
- [x] func moneySpentLastDay() -> Dollar?
- [x] func moneySpentOverTime() -> [Time:Dollar]
- [x] func moneySpentMoreThanAverage() -> Dollar?
- [x] func topUsers() -> [LeaderboardUser]
- [x] func sendElectricityUsage(amount: ElectricityAmount)

---

# BACKEND

## REST
- [x] POST /user/new
  - new user.
  - basic auth usr and pass
- [x] POST /login/new
  - post a new login session
  - after auth, set session param to sessio id
  - basic auth usr and pass
  - return success/failure
- [x] GET /moneyspent/lastweek
- [ ] GET /moneyspent/lastday **skip**
- [x] GET /moneyspent/overtime
  - return array of money objects
- [x] GET /moneyspent/compared
  - get (money spent last week for me) - (money spent last week avg)
- [x] GET /user/top
  - get top 5 users
- [x] POST /usage
- [x] create proper format for responses
  - {ok:true|false, content:{...}}
- [x] POST /rewards

## USER DATABASE
- [x] Store users
- [x] Store (kwh meter reading, timestamp) for each user.

## REWARDS
- [ ] Periodic (every day):
  - give rewards points to top three people

