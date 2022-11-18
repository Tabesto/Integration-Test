package tabesto.cis.zelty;

import com.intuit.karate.junit5.Karate;


public class ApiZeltyDispoRunner {
    @Karate.Test
    Karate testdispoZeltyOK() {
        return Karate.run("dispoBOZeltyOK.feature").relativeTo(getClass());

    }

    @Karate.Test
    Karate testDispoZeltyKO() {
        return Karate.run("dispoZeltyKO.feature").relativeTo(getClass());
    }

}
