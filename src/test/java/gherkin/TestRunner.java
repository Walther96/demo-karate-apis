package gherkin;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:gherkin")
                .outputCucumberJson(true)
                .outputJunitXml(true)
                .parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
