package gherkin;

import com.intuit.karate.junit5.Karate;

public class ReqresRunner {

    @Karate.Test
    Karate testReqres() {
        return Karate.run("classpath:gherkin/reqres").relativeTo(getClass());
    }

}
