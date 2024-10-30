import PgHelper from "../helpers/pg-helper.js";


export default class TareaRepository
{
    getAllAsync = async () => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT * FROM  "Tarea"`);
    }

    getByIdCategoria = async (idCategoria) => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT * FROM "Tarea" WHERE "IdCategoria" = ${idCategoria} AND "Tomada" = false ORDER BY "TiempoCreacion" DESC LIMIT 1`);
    }

    assignIdUsuarioToTarea = async (idUsuario, idTarea) =>
    {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`SELECT actualizar_usuario_tarea(${idUsuario}, ${idTarea})`);
    }

    createAsync = async (entity) => 
    {
        console.log("entidad ",entity)
        const descripcion = entity.descripcion.toString()
        let clientSocket = null
        if(entity.clientSocket){
            clientSocket = entity.clientSocket.toString()
        }
        console.log("otro console.log ",descripcion,clientSocket)

        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(        
            `INSERT INTO "Tarea"
                ("Descripcion", "Tomada", "IdCategoria", "IdCliente", "IdUsuario", "ClientSocket")
            VALUES
                ('${entity.descripcion}', ${entity.tomada}, ${entity.idCategoria}, ${entity.idCliente}, ${entity.idUsuario}, '${entity.clientSocket}')`
        )
    }

    deleteByIdAsync = async (id) => 
    {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(`DELETE FROM "Tarea" WHERE "Id" = ${id}`);
    }

    
}
