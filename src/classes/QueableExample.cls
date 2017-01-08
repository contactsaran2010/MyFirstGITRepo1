Public Class QueableExample implements Queueable
{
   Private List<Account> lstAcct = New List<Account>();
   
   Public void UpdateAccountDescription(List<Account> paramlstacct)
   {
       lstAcct = paramlstacct;
   }
    
    Public Void Execute(QueueableContext QC)
    {
          for ( Account acc : lstAcct)
          {
             If (acc.Description == null)
             {
                  acc.Description = 'Updated by Queable';          
             }
          }  
          update lstAcct;
        }
}