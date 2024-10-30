import {Router} from 'express';
import ClienteService from '../service/cliente-service.js';

const router = Router();
const svc = new ClienteService();


router.get('/:id', async (req, res) => 
{
    let id = req.params.id;
    
    let respuesta;
    const returnArray = await svc.getByIdAsync(id);

    
    if(returnArray != "")
    {
        respuesta = res.status(201).json(returnArray);

    }
    else
    {
        respuesta = res.status(404).send(`Id no encontrado`)
    }

    

    return respuesta;
});


export default router;