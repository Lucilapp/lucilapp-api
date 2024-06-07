import FiltroRepository from "../repositories/filtro-repository.js"; 


export default class FiltroService
{
    getAllAsync = async () => {
        const repo = new FiltroRepository();
        const returnArray = await repo.getAllAsync();
        return returnArray;
    }

}