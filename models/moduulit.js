const Mysql = require("mysql");


const yhteys = Mysql.createConnection({
                                        "host":"",
                                        "user":"", 
                                        "password":"",
                                        "database":""
                                    });


yhteys.connect((err)=>{

    if(!err){

        console.log("Yhteys toimii!");
    }
    else{

        throw err
    }

});


module.exports = {

                    haeKaikki:(callback)=>{

                        let sql =  "SELECT * FROM keskustelut"

                        yhteys.query(sql,(err,data)=>{


                            callback(err,data);
                        })

                    },

                    haeKeskustelut:(id,callback)=>{

                        let sql =  "SELECT * FROM keskustelut WHERE id = ?";

                        yhteys.query(sql,[id],(err,data)=>{

                            callback(err,data);
                            
                        });
                        

                    },


                    lisaaKeskustelu:(tiedot,callback)=>{

                        if(tiedot.kirjoittaja==""){

                            tiedot.kirjoittaja="Anonyymi"
                        }


                        let sql = "INSERT INTO keskustelut (id,otsikko,sisalto,kirjoittaja) VALUES ?";

                       

                        let uusiRivi = [[tiedot.id,tiedot.otsikko,tiedot.sisalto,tiedot.kirjoittaja]];

                        yhteys.query(sql,[uusiRivi],(err,data)=>{

                        
                        
                       callback(err,tiedot);
    
                    });

                },

                lisaaKommentti:(tiedot,callback)=>{ 

                    let sql = "INSERT INTO viestit (id,sisalto,kirjoittaja) VALUES ?";

                    

                    let uusi = [[tiedot.id,tiedot.sisalto,tiedot.kirjoittaja]];
                    

                        yhteys.query(sql,[uusi],(err,data)=>{


                            
                            callback(err,tiedot);
         
                         });
                  
                    

                },

                haeKommentti:(keskustelutId,callback)=>{

                    let sql =  "SELECT * FROM viestit WHERE keskustelutId = ?";

                    

                    yhteys.query(sql,[keskustelutId],(err,data)=>{
                        
                        console.log(keskustelutId);
                        callback(err,data);
                    });
                    

                },
        
}