import express from "express"; 
import cors from "cors"; 

const app = express(); 
const port = 3000; //Elpuerto3000(http://localhost:3000) 

//AgregolosMiddlewares 
app.use(cors());  
app.use(express.json());




app.listen(port,()=>
{
    console.log(`Exampleapplisteningonport${port}`) 
})

