import SqlHelper from "../helpers/sql-helper.js";


export default class FiltroRepository
{
    getAllAsync = async () => {
        const sql = new SqlHelper();
        return sql.sqlQuery("SELECT * FROM  Filtro");
    }
}