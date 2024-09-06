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
        //no anda
        console.log(entity)
        const descripcion = entity.descripcion.toString()
        const clientSocket = entity.clientSocket.toString()
        console.log(descripcion,clientSocket)

        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery(        
            `INSERT INTO "Tarea"
                ("Descripcion", "Tomada", "IdCategoria", "IdCliente", "IdUsuario", "ClientSocket")
            VALUES
                ('${entity.descripcion}', ${entity.tomada}, ${entity.idCategoria}, ${entity.idCliente}, ${entity.idUsuario}, '${entity.clientSocket}')`
        )
    }
    
}
