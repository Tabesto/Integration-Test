package tabesto.oca;

import com.intuit.karate.junit5.Karate;


public class ApiOcaRunner {
    @Karate.Test
    Karate testGetCachedMenu() {
        return Karate.run("getCachedMenu.feature").relativeTo(getClass());

    }

}
