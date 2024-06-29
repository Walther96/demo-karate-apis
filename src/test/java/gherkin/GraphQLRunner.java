package gherkin;

import com.intuit.karate.junit5.Karate;

public class GraphQLRunner {

    @Karate.Test
    Karate testGraphQL() {
        return Karate.run("classpath:gherkin/graphql").relativeTo(getClass());
    }

}
