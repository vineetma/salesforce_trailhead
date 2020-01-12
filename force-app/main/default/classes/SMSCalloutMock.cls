@isTest

global class SMSCalloutMock implements HttpCalloutMock {
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-Type', 'application/json');
    res.setBody('{"status": "success"}');
    res.setStatusCode(200);
    return res;
}