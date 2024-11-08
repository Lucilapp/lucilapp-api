import UsuarioRepository from "../repositories/usuario-repository.js"; 

export default class UsuarioService
{
    createAsync = async (entity) => 
    {
        const repo = new UsuarioRepository();
        const returnArray = await repo.createAsync(entity);
        return returnArray;
    }

}