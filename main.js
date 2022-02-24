const express=require("express");
const app = express();
const bodyParser=require("body-parser");
const portti = 3107;

const keskustelut = require("./models/moduulit");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({"extended":true}));

app.set("views","./views");
app.set("view engine","ejs");




app.post("/tallenna",(req,res)=>{

    keskustelut.lisaaKeskustelu(req.body,(err)=>{

        if (err) throw err;
        res.redirect("/");
        

    });

});

app.post("/muokkaa/:id",(req,res)=>{

    keskustelut.lisaaKommentti(req.body,(err,data)=>{
        
        if (err) throw err;
        res.redirect("/");

    })
});


app.get("/",(req,res)=>{

    keskustelut.haeKaikki((err,data)=>{

        if (err) throw err;
        
        res.render("keskustelu",{"keskustelut":data});
        
        
    });

    
});




app.get("/tallenna",(req,res)=>{

    res.render("uusikeskustelu",{});
    

});

app.get("/muokkaa/:id",(req,res)=>{

    let id = req.params.id;

    keskustelut.haeKeskustelut(id,(err,data)=>{

        if (err) throw err;

        keskustelut.haeKommentti(id,(err,data1)=>{
            if (err) throw err;

            
                res.render("kirjoita",{"kommentit":data,"viestit":data1});

            

           
            
        })


            
    

    })

    

});




app.listen(portti,()=>{

    console.log(`Palvelin käynnistyi porttiin ${portti}`);
    
    });