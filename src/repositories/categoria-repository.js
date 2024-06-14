import SqlHelper from "../helpers/sql-helper.js";


export default class CategoriaRepository
{
    getAllAsync = async () => {
        const sql = new SqlHelper();
        return sql.sqlQuery("SELECT * FROM  Categoria");
    }

    getByIdFiltro = async (idFiltro) => 
    {
        const sql = new SqlHelper();
        const values = [idFiltro]

        return sql.sqlQuery(`SELECT * FROM Categoria INNER JOIN Categoria_Filtro ON Categoria.Id = Categoria_Filtro.IdCategoria INNER JOIN Filtro ON Categoria_Filtro.IdFiltro = Filtro.Id WHERE Filtro.Id = ${idFiltro}`);
    }  
}