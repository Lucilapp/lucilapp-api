import ClienteRepository from "../repositories/cliente-repository.js"; 


export default class ClienteService
{
    getByIdAsync = async (id) => 
    {
        const repo = new ClienteRepository();
        const returnArray = await repo.getByIdAsync(id);
        return returnArray;

    }
}