import TareaRepository from "../repositories/tarea-repository.js"; 


export default class TareaService
{
    getAllAsync = async () => {
        // no se va a usar
        const repo = new TareaRepository();
        const returnArray = await repo.getAllAsync();
        return returnArray;
    }

    getByIdCategoria = async (idCategoria) => 
    {

        const repo = new TareaRepository();
        const returnArray = await repo.getByIdCategoria(idCategoria);
        return returnArray;

    }

    assignIdUsuarioToTarea = async (idUsuario, idTarea) =>
    {
        const repo = new TareaRepository();
        const returnArray = await repo.assignIdUsuarioToTarea(idUsuario, idTarea)
        return returnArray;
    }


    createAsync = async (entity) => 
    {
        const repo = new TareaRepository();
        const returnArray = await repo.createAsync(entity);
        return returnArray;
    }

    deleteByIdAsync = async (id) =>
    {
        const repo = new TareaRepository();
        const Events = await repo.deleteByIdAsync(id);
        return Events;
    }
}