import express from "express"; 
import cors from "cors"; 
import FiltroRouter from "./src/controllers/filtro-controller.js";
import CategoriaRouter from "./src/controllers/categoria-controller.js";
import TareaRouter from "./src/controllers/tarea-controller.js";
import ReporteRouter from "./src/controllers/reporte-controller.js";
import ClienteRouter from "./src/controllers/cliente-controller.js";


const app = express(); 
const port = 3000; //Elpuerto3000(http://localhost:3000) 

//AgregolosMiddlewares 
app.use(cors());  
app.use(express.json());


app.use("/api/filtro",FiltroRouter);
app.use("/api/categoria",CategoriaRouter);
app.use("/api/tarea",TareaRouter); 
app.use("/api/reporte",ReporteRouter); 
app.use("/api/cliente",ClienteRouter); 



app.listen(port,()=>
{
    console.log(`Exampleapplisteningonport${port}`) 
})

