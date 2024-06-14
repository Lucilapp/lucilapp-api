import PgHelper from "../helpers/pg-helper.js";


export default class CategoriaRepository
{
    getAllAsync = async () => {
        const pgHelper = new PgHelper();
        return pgHelper.sqlQuery("SELECT * FROM  Categoria");
    }

    getByIdFiltro = async (idFiltro) => 
    {
        const pgHelper = new PgHelper();
        const values = [idFiltro]

        return pgHelper.sqlQuery(`SELECT * FROM Categoria INNER JOIN Categoria_Filtro ON Categoria.Id = Categoria_Filtro.IdCategoria INNER JOIN Filtro ON Categoria_Filtro.IdFiltro = Filtro.Id WHERE Filtro.Id = ${idFiltro}`);
    }  
}