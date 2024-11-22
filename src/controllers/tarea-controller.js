import {Router} from 'express';
import TareaService from '../service/tarea-service.js';
import Autentication from '../middlewares/autentication-middlewares.js';

const router = Router();
const mw = new Autentication();
const svc = new TareaService();

// Home BackEnd

router.get('/', async (req, res) => {
    // no se va a usar este end point
    let respuesta;
    const returnArray = await svc.getAllAsync();
    if(returnArray != null)
    {
        respuesta = res.status(200).json(returnArray);
    } 
    else
    {
        respuesta = res.status(500).send(`Error interno.`)
    }
    return respuesta;
});

router.get('/:idCategoria', mw.desencriptacion, async (req, res) => 
{

    let idCategoria_ = req.query.idCategoria;
    let respuesta;
    const returnArray = await svc.getByIdCategoria(idCategoria_);

    
    if(returnArray != "")   
    {
        respuesta = res.status(201).json(returnArray);

    }
    else
    {
        respuesta = res.status(404).send(`Tarea no encontrada`)
    }

    

    return respuesta;
});

router.patch('/:idUsuario/:idTarea', mw.desencriptacion, async (req, res) => 
    {
    
        let idUsuario_ = req.params.idUsuario;
        let idTarea_ = req.params.idTarea;

        let respuesta;
        const returnArray = await svc.assignIdUsuarioToTarea(idUsuario_, idTarea_);
    
        
        if(returnArray != "")   
        {
            respuesta = res.status(201).json(returnArray);
    
        }
        else
        {
            respuesta = res.status(404).send(`error`)
        }
    
        
    
        return respuesta;
    });
    




//Chat BackEnd

router.post('', mw.desencriptacion, async (req, res) => 
{
    let respuesta
    let entity = req.body;
    const currentTimestampMillis = Date.now();
    const timestamp = new Date(currentTimestampMillis - 10800000 );
    const formattedTimestamp = timestamp.toISOString().slice(0, 19).replace('T', ' ').replace('Z', '');
    entity.tiempoCreacion = formattedTimestamp;
    const returnArray = await svc.createAsync(entity);
    if(returnArray != null)
    {
        respuesta = res.status(201).json(returnArray);
    }
    else
    {
        respuesta = res.status(500).send(`Error interno.`)
    }

    return respuesta
})

router.delete('/:id', mw.desencriptacion, async (req, res) => 
{  
    let id = req.params.id;
    let respuesta;
    
    const returnArray = await svc.deleteByIdAsync(id);

    respuesta = res.status(200).json(returnArray);
 
    return respuesta;

})

export default router; 