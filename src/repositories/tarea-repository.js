import SqlHelper from "../helpers/sql-helper.js";


export default class TareaRepository
{
    getAllAsync = async () => {
        const sql = new SqlHelper();
        return sql.sqlQuery("SELECT * FROM  Tarea");
    }

    getByIdCategoria = async (idCategoria) => 
    {
        const sql = new SqlHelper();
        return sql.sqlQuery(`SELECT TOP 1 * FROM Tarea WHERE idCategoria = ${idCategoria} AND Tomada = 0 ORDER BY TiempoCreacion DESC`);
    }   
}

