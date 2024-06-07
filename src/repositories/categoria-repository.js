import DBConfig from '../configs/DBConfig.js';
import sql from 'mssql';


export default class CategoriaRepository
{
    getAllAsync = async () => {
        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query("SELECT * FROM  Categoria");
        return result.recordset;
    }

    getByIdFiltro = async (idFiltro) => 
    {

        let pool = await sql.connect(DBConfig);
        let result = await pool.request().query
        (
            `SELECT * FROM Categoria
            INNER JOIN Categoria_Filtro ON Categoria.Id = Categoria_Filtro.IdCategoria
            INNER JOIN Filtro ON Categoria_Filtro.IdFiltro = Filtro.Id
            WHERE Filtro.Id = ${idFiltro}
            `
        );
        return result.recordset;
    }  
}