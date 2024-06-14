import PgHelper from "../helpers/pg-helper.js";


export default class TareaRepository
{
    getAllAsync = async () => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery("SELECT * FROM  Tarea");
    }

    getByIdCategoria = async (idCategoria) => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT * FROM Tarea WHERE IdCategoria = ${idCategoria} AND Tomada = false ORDER BY TiempoCreacion DESC LIMIT 1`);
    }
    
}

