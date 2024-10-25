const { Router } = require('express')
const premierLeagueController = require("../controllers/premierLeague")

premierLeagueRouter = Router()

premierLeagueRouter.get('/', premierLeagueController.home)
premierLeagueRouter.get('/all', premierLeagueController.index)
premierLeagueRouter.get('/:id', premierLeagueController.show)

module.exports = premierLeagueRouter