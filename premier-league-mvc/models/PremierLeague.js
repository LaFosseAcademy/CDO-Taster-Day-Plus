const db = require("../db/connect")

class Player {
    constructor({player_id, name, nationality, age, position, team}) {
        this.id = player_id
        this.name = name
        this.nationality = nationality
        this.age = age
        this.position = position
        this.team = team
    }

    static async getAll() {
        try {
            const { rows } = await db.query("SELECT * FROM players;")
            if (!rows.length) {
                throw new Error("No players found")
            }
            return rows.map(player => new Player(player))
        } catch (error) {
            throw new Error("Error fetching players")
        }
    }

    static async getOne(id){
        try {
            const { rows } = await db.query("SELECT * FROM players WHERE player_id = $1;", [id])
            if (rows.length !== 1) {
                throw new Error("No player found")
            }
            return new Player(rows[0])
        } catch (error) {
            throw new Error("Error fetching player")
        }
    }

}

module.exports = { Player }