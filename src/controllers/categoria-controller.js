import {Router} from 'express';
import CategoriaService from '../service/categoria-service.js';
import Autentication from '../middlewares/autentication-middlewares.js';

const router = Router();
const mw = new Autentication();
const svc = new CategoriaService();

router.get('/', mw.desencriptacion, async (req, res) => {
    let respuesta;
    const returnArray = await svc.getAllAsync();
    if(returnArray != null)
    {
        respuesta = res.status(200).json({returnArray});
    } 
    else
    {
        respuesta = res.status(500).send(`Error interno.`)
    }
    return respuesta;
});

router.get('/:idFiltro', mw.desencriptacion, async (req, res) => 
{
    let idFiltro_ = req.query.idFiltro;
    let respuesta;
    const returnArray = await svc.getByIdFiltro(idFiltro_);

    
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


export default router; 