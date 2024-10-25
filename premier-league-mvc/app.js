const express = require('express')
const cors = require('cors')

const logger = require('./logger')
const tourDeFranceRouter = require('./router/premierLeague')


const app = express()

// Middleware
app.use(express.json())
app.use(cors())
app.use(logger)

// Routing
app.get("/", (req, res) => {
    res.send("Hello World!")
})

app.use('/premier-league', premierLeagueRouter)

module.exports = app