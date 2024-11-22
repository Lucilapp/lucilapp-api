import {Router} from 'express';
import UsuarioService from '../service/usuario-service.js';

const router = Router();
const svc = new UsuarioService(); 

router.post('/registro', async (req, res) => 
{
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

router.post('/login', async(req, res)=>
{
    const returnArray = await svc.getByUsernamePassword(req.body.mail, req.body.contrasenia);


    if(returnArray != "")
    {

        const GetAll = await svc.LogIn(req.body.mail, req.body.contrasenia)
        let token = GetAll.token;
        
        res.status(200).send({token})

        
    }
    else
    {
        res.status(401).json({success: false, message: 'usuario o contraseña invalido'});
    }



})



export default router; 