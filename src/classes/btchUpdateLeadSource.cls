Global Class btchUpdateLeadSource implements Database.Batchable <sObject>, Database.Stateful
{
    Global Integer intProcessedLeads = 0;
    Global Database.QueryLocator start (Database.BatchableContext BC)
    {   
        return Database.getQueryLocator ('select id,Leadsource from Lead');
    }
    
    Global void Execute (Database.BatchableContext BC, List<Lead> Scope)
    {
        for (Lead lead : Scope)
        {
            lead.LeadSource = 'Dreamforce 2017';
            intProcessedLeads = intProcessedLeads  + 1;
        }
        Update Scope;
    }
    
    Global Void finish (Database.BatchableContext BC)
    {
        System.Debug(intProcessedLeads   + ' Finished Lead Update Successfully');
    }
}