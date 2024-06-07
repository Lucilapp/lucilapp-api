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
        let objValues = {};
        let i = 1;
        values.forEach(element => {
            objValues[i] = element;
            i++;
        });
        console.log(objValues);
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query(query,values);
        return result.recordset;
    }
}