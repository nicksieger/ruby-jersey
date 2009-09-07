package ruby;

import com.sun.grizzly.http.embed.GrizzlyWebServer;
import com.sun.grizzly.http.servlet.ServletAdapter;
import com.sun.jersey.spi.container.servlet.ServletContainer;

public class Main {
    public static void main(String[] args) {
        // static content is linked from here
        GrizzlyWebServer gws = new GrizzlyWebServer(9998);

        // Jersey web resources
        ServletAdapter jerseyAdapter = new ServletAdapter();
        jerseyAdapter.addInitParameter("com.sun.jersey.config.property.packages",
                                       "ruby");
        jerseyAdapter.setContextPath("/jersey");
        jerseyAdapter.setServletInstance(new ServletContainer());

        // register all above defined adapters
        gws.addGrizzlyAdapter(jerseyAdapter);

        // let Grizzly run
        try {
            System.out.println("Foo started on http://localhost:9998");
            gws.start();
        } catch (Exception e) {
        }
    }
}
