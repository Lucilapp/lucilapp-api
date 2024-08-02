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

}