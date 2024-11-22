import {Router} from 'express';
import FiltroService from '../service/filtro-service.js';
import Autentication from '../middlewares/autentication-middlewares.js';

const router = Router();
const mw = new Autentication();
const svc = new FiltroService();

router.get('/', mw.desencriptacion, async (req, res) => {
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

export default router; 