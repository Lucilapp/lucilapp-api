import UsuarioRepository from "../repositories/usuario-repository.js"; 
import jwt from 'jsonwebtoken';

const key = 'Clavesecreta2000$';
const options =
{
    expiresIn:  '1h',
    issuer: 'mi_organizacion'
}

export default class UsuarioService
{
    createAsync = async (entity) => 
    {
        const repo = new UsuarioRepository();
        const returnArray = await repo.createAsync(entity);
        return returnArray;
    }

    getByUsernamePassword = async (mail, contrasenia) => 
    {

        const repo = new UsuarioRepository();
        const returnArray = await repo.getByUsernamePassword(mail, contrasenia);
        return returnArray;

    }

    LogIn = async (mail, contrasenia) =>
    {
        const repo = new UsuarioRepository();
        const returnArray = await repo.getByUsernamePassword(mail, contrasenia);
        const payload = 
        {
            id: returnArray[0].id,
            username: returnArray[0].username
        }

        let token = jwt.sign(payload, key, options);


        
        return {token};
    }

}