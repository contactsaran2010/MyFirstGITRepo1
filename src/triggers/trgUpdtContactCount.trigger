trigger trgUpdtContactCount on Contact (after insert, before delete) {

    
         Map<id,Account> mapAccount = New Map<id,Account> ([select id,name,number_of_contacts__c from Account]);
         List <Account> lstAcct = new List<account> ();
         List <Account> lstAcctDel = new List<account> ();
         Account recTempAcctUpd;
        
        if(trigger.IsInsert)
         {
             for (contact Con : trigger.new)
                {   
                     If(MapAccount.ContainsKey(Con.AccountId))
                     {                    
                        recTempAcctUpd= MapAccount.get(Con.AccountId);
                        system.Debug(recTempAcctUpd.Name);
                        If(recTempAcctUpd.number_of_contacts__c ==null)
                            recTempAcctUpd.number_of_contacts__c = 0;
                        recTempAcctUpd.number_of_contacts__c = recTempAcctUpd.number_of_contacts__c + 1;
                        lstAcct.Add(recTempAcctUpd);
                     }                                                 
                }             
         }
            
         if(trigger.IsDelete)
         {

            for (contact Con : trigger.old)
            {   
                 If(MapAccount.ContainsKey(Con.AccountId))
                 {                    
                    recTempAcctUpd= MapAccount.get(Con.AccountId);
                    system.Debug(recTempAcctUpd.Name);
                    If(recTempAcctUpd.number_of_contacts__c ==null)
                        recTempAcctUpd.number_of_contacts__c = 0;
                        recTempAcctUpd.number_of_contacts__c = recTempAcctUpd.number_of_contacts__c - 1;
                        lstAcct.Add(recTempAcctUpd);
                 }                                                 
             }             
          }

        Update lstAcct;
}