package gherkin;

import com.intuit.karate.junit5.Karate;

class BookerRunner {

    @Karate.Test
    Karate testBooker() {
        return Karate.run("classpath:gherkin/booker").relativeTo(getClass());
    }

}