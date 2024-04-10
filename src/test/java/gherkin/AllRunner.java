package gherkin;

import com.intuit.karate.junit5.Karate;

class AllRunner {

    @Karate.Test
    Karate testAllApis() {
        return Karate.run("classpath:gherkin").relativeTo(getClass());
    }



}
