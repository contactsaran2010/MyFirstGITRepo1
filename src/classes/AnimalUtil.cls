Public Class AnimalUtil
{
    Public animal wrAnimal = new Animal();      
    //List<object> lstAnmials;
    @future(callout=true)
    public static void updateDescr(string AcctId)
    {
        String strDesc;
        Map<String,Object> mapwrAnimal; 
         
        Http http =new Http();
        HttpRequest Req = New HttpRequest();
        Req.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/');
        Req.SetMethod('GET');
        //Req.setHeader('Content-Type', 'application/json');
        //Req.SetBody('{"id", "0"}');
        HttpResponse res = Http.send(Req);
        System.debug('Response ' + res.getBody());
        //string MockRes = '{"animal":{"name":"","eats":"","says":""}}';
        if (res.getStatusCode() == 200) { 
              mapwrAnimal= (Map<String,Object>) JSON.deserializeUnTyped( res.getBody());
              List<object> lstAnmials = (List<object>) mapwrAnimal.get('animals');
              Account AcctUpd = [select id,Description from Account where Id=:AcctId];
              for (Object ani : lstAnmials ) { 
                   strDesc = strDesc + ' ' + ani;
                }
               AcctUpd.Description = strDesc;
               update AcctUpd;
         } 
         return;
    }
    
    Public Class animal
    {
         public Animal animal;
         public string id{get;set;}
         Public string name{get;set;}
         public string eats{get;set;}
         Public string says{get;set;}          
    }    
}