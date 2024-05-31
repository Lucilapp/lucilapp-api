import CategoriaRepository from "../repositories/categoria-repository.js"; 


export default class CategoriaService
{
    getAllAsync = async () => {
        const repo = new CategoriaRepository();
        const returnArray = await repo.getAllAsync();
        return returnArray;
    }

}