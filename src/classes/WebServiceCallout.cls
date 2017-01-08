public class WebServiceCallout
{

public void RestCallout()
{

Http h = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('https://ap2.salesforce.com/services/apexrest/SampleRest');
req.setMethod('POST');
req.setHeader('Content-Type', 'application/json');
req.setHeader('Authorization', 'Bearer ' + Userinfo.getSessionId());
req.setBody('{"Name":"GenePoint"}');
HttpResponse res = h.send(req);
system.debug(res.getbody());

}

}