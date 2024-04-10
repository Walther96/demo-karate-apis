package gherkin;

import com.intuit.karate.junit5.Karate;

public class CsvRunner {

    @Karate.Test
    Karate testCsv() {
        return Karate.run("classpath:gherkin/ddt").relativeTo(getClass());
    }

}
