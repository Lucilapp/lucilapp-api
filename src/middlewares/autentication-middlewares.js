import jwt from 'jsonwebtoken';
const key = 'Clavesecreta2000$';
const options =
{
    expiresIn:  '1h',
    issuer: 'mi_organizacion'
}


export default class Autentication
{
    desencriptacion = async (req, res, next) =>
    {
        let respuesta;
        let substring = req.headers.authorization;
        let payload = null;
        try 
        {
            substring = substring.substring(7);
            //console.log(substring);
            payload = jwt.verify(substring, key, options)
            //console.log(payload)
            respuesta = res.status(200);
        }
        catch(e)
        {
            respuesta = res.status(401).send("token no valido")
        }

        if(payload != null)
        {
            req.user = payload
            next();
        }
        else
        {
            return respuesta;
        }
    }
}