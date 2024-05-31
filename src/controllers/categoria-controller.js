import {Router} from 'express';
import CategoriaService from '../service/categoria-service.js';

const router = Router();
const svc = new CategoriaService();

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