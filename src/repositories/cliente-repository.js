import PgHelper from "../helpers/pg-helper.js";

export default class ClienteRepository
{
    getByIdAsync = async (id) => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT * FROM  "Cliente" WHERE "Id" = ${id}`);
    }
}