import DBConfig from '../configs/DBConfig.js';
import sql from 'mssql';


export default class TareaRepository
{
    getAllAsync = async () => {
        // no se va a usar
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query("SELECT * FROM  Tarea");
        return result.recordset;
    }

    getByIdCategoria = async (idCategoria) => 
    {
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query
        (
            `SELECT TOP 1 * FROM Tarea WHERE idCategoria = ${idCategoria} AND Tomada = 0 ORDER BY TiempoCreacion DESC
            `
        );
        return result.recordset;
    }   
}

