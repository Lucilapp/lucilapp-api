import PgHelper from "../helpers/pg-helper.js";

export default class ReporteRepository
{
    createAsync = async (entity) => 
        {    
            //falta corregir error undefined de las columnas
            console.log("entidad ",entity)
            const pgHelper = new PgHelper();
            return pgHelper.sqlQuery(        
                `INSERT INTO "Reporte"
                    ("IdUsuario", "IdCliente", "Reporte")
                VALUES
                    (${1}, ${entity.IdCliente}, '${entity.Reporte}')`
            )
        }
}