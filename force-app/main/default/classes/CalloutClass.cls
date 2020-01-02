//for learning purpose only. Can't be executed. Change the endpoint to use and also add the remote site in salesforce
public class CalloutClass {
    @future(callout = true)
    public static void makeCallout() {
        HttpRequest request = new HttpRequest();

        String endpoint = 'http://yourHost/yourService';
        request.setEndPoint(endPoint);

        request.setMethod('GET');

        HttpResponse response = new HTTP().send(request);
    }
}
