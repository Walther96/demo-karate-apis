package gherkin.booker;

import com.intuit.karate.junit5.Karate;

class BookerRunner {

    @Karate.Test
    Karate testBooker() {
        return Karate.run("restful-booker").relativeTo(getClass());
    }

}