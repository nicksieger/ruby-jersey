package ruby;

import javax.ws.rs.*;

@Path("/helloworld")
public class HelloWorldResource {

    // The Java method will process HTTP GET requests
    @GET
    // The Java method will produce content identified by the MIME Media
    // type "text/plain"
    @Produces("text/plain")
    public String getMessage() {
        // Return some cliched textual content
        return "Hello World";
    }

    @GET @Produces("text/plain") @Path("{id}")
    public String getPersonalMessage(@PathParam("id") String message) {
        return "Hello " + message;
    }
}