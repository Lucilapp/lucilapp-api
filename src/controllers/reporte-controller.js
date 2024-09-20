import {Router} from 'express';
import ReporteService from '../service/reporte-service.js';

const router = Router();
const svc = new ReporteService();

router.post('', async (req, res) => 
    {
        let respuesta
        let entity = req.body;
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

export default router; 