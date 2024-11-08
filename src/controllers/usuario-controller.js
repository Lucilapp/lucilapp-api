import {Router} from 'express';
import UsuarioService from '../service/usuario-service.js';

const router = Router();
const svc = new UsuarioService(); 

router.post('/registro', async (req, res) => 
{
    // nombre completo, mail, telefono, contraseña
    let respuesta
    let entity = req.body;


    if(entity != null)
    {
        const returnArray = await svc.createAsync(entity);
        respuesta = res.status(201).json(returnArray);

    }
    else
    {
        respuesta = res.status(500).send(`Error interno.`)
    }

    return respuesta
})

export default router; 