package gherkin;

import com.intuit.karate.junit5.Karate;

class GorestRunner {

    @Karate.Test
    Karate testGorest() {
        return Karate.run("classpath:gherkin/gorest").relativeTo(getClass());
    }

}