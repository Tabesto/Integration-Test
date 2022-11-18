package tabesto;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class IntegrationTest {
    @Karate.Test
    void testParallel() {
        Results results = Runner.path("classpath:tabesto").tags("~@ignore").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
