const { Player } =  require("../models/PremierLeague")

const home = async (req, res) => {
    res.status(200).json({
        success:true,
        response:"Welcome to the Premier League Player API"
    })
}

const index = async (req, res) => {
    try {
        const players = await Player.getAll()
        res.status(200).json({
            success:true,
            players:players
        })
    } catch (err) {
        res.status(500).json({
            success:false,
            message:"Unable to retrieve players",
            error:err
        })
    }
}

const show = async (req, res) => {
    try {
        const id = parseInt(req.params.id)
        const player = await Player.getOne(id)
        res.status(200).json({
            success:true,
            player:player
        })

    } catch (err) {
        res.status(500).json({
            success:false,
            messge:"Unable to retrieve player",
            error:err
        })
    }
}


module.exports = {
    home,
    index,
    show
}