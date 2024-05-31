import DBConfig from '../configs/DBConfig.js';
import sql from 'mssql';


export default class CategoriaRepository
{
    getAllAsync = async () => {
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query("SELECT * FROM  Categoria");
        return result.recordset;
    }
}