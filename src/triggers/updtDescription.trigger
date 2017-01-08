trigger updtDescription on Account (after insert, after update) {
    //AnimalUtil updtDesc=new AnimalUtil ();
    If(trigger.Isinsert)
    {
        for(Account acct : Trigger.New)
        {
         AnimalUtil.updateDescr(acct.id);      
        }
    }
}