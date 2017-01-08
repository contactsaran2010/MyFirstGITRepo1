Global Class UpdateContactAddress implements Database.Batchable <sObject>, Database.Stateful
{
 global Integer intRecordsProcessed = 0;
 Global Database.QueryLocator start (Database.BatchableContext BC)
 {
     Return Database.getQueryLocator(
    'select BillingStreet, BillingCity, BillingState, BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, MailingState, MailingPostalCode FROM Contacts) FROM Account ');    
 }  

 Global void execute (Database.BatchableContext BC, List<Account> scope)
 {
    List<contact> lstContact = New List<Contact>();
    for(Account acc : scope)
    {
        for(Contact con : acc.contacts)
        {
            
            con.MailingStreet = acc .BillingStreet; 
            con.MailingCity = acc .BillingCity; 
            con.MailingState = acc .BillingState; 
            con.MailingPostalCode = acc .BillingPostalCode; 
            lstContact.Add(con);
            intRecordsProcessed = intRecordsProcessed  + 1;
        }
    }
    Update lstContact;
 }

 global void finish(Database.BatchableContext bc){
 system.Debug( ' Number of records Processed ' + intRecordsProcessed );
 }
  
}