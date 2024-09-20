import PgHelper from "../helpers/pg-helper.js";

export default class ReporteRepository
{
    createAsync = async (entity) => 
        {    
            console.log("entidad ",entity)
            const pgHelper = new PgHelper();
            return pgHelper.sqlQuery(        
                `INSERT INTO "Reporte"
                    ("IdUsuario", "IdCliente", "Reporte")
                VALUES
                    (${entity.IdUsuario}, ${entity.IdCliente}, '${entity.Reporte}')`
            )
        }
}