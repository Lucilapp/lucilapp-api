import DBConfig from '../configs/DBConfig.js';
import sql from 'mssql';


export default class SqlHelper
{
    sqlQuery = async (query) => {
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query(query);
        return result.recordset;
    }

    sqlQueryValues = async (query, values) => {
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query(query,values);
        return result.recordset;
    }
}