@RestResource(urlmapping='/SampleRest/*')
global class WebserviceSample
{
 
 @HttpPost
 global static List<Account> getMethod(string Name)
     {
         List<Account> lstAcct = [select id,Name from Account where Name like :Name];
         return lstAcct;
     } 

 @HttpGet   
 global static void orthermethod() 
     {
         
     }
     Public Class Wrapper
     {
         Public String Name;
         Public Boolean len;
         Public List<Wrapper> Wrapper(List<Account> acct)
         {
          
          List<Wrapper> lstWrapper; 
          for( Account a : acct)
          {
              /*if(a.name.length > 2)
              {
                  a.len=true;
              }
              else
              {
                  a.len = false;
              }
              lstWrapper.add(a);*/
          }
          return lstWrapper; 
         }
     }     
}