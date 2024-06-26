import PgHelper from "../helpers/pg-helper.js";

export default class FiltroRepository {

    
    getAllAsync = async () => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT * FROM "Filtro"`);
    }
}