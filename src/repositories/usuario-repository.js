import PgHelper from "../helpers/pg-helper.js";

export default class UsuarioRepository
{
    createAsync = async (entity) => 
    {    
        console.log("entidad ",entity)
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(        
            `INSERT INTO "Usuario"
                ("Nombre", "Contrasenia", "Mail", "Telefono", "Dni")
            VALUES
                ('${entity.nombre}', '${entity.contrasenia}', '${entity.mail}', '${entity.telefono}', '${entity.dni}')`
        )
    }

}