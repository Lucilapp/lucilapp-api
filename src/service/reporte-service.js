import ReporteRepository from "../repositories/reporte-repository.js"; 

export default class ReporteService
{
    createAsync = async (entity) => 
        {
            const repo = new ReporteRepository();
            const returnArray = await repo.createAsync(entity);
            return returnArray;
        }
}