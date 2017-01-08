@IsTest
Public Class tstupdtDescription 
{
    public Void updtDesc()
    {
        Account acctTst =New Account(Name='test Account');
        insert acctTst;
        acctTst.Name ='Name Changed from test Account';
        Update acctTst;
    }
}