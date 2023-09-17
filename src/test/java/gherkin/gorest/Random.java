package gherkin.gorest;

import com.github.javafaker.Faker;

public class Random {

    public static String getName(){
        Faker faker = new Faker();

        String name = faker.name().fullName();

        return name;
    }

    public static String getEmail(){
        Faker faker = new Faker();

        String username = faker.name().username();
        String mail = username+"@testing.com";

        return mail;
    }

}
