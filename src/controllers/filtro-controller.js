import {Router} from 'express';
import FiltroService from '../service/filtro-service.js';

const router = Router();
const svc = new FiltroService();

router.get('/', async (req, res) => {
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