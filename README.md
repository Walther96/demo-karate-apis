# Automation Project with Karate DSL 

This is my personal portfolio about an API automation project using Karate DSL.

## Pre-requisites:
    - Java 17+
    - Maven 3.9.x


### COMMAND TO RUN TESTS:

  **Command to run all Tests:**
    
    mvn clean test

 **Command to run *"Restful-booker API"* tests:**

    mvn clean test "-Dkarate.options=--tags @booker"

**Command to run *"Go REST API"* tests:**
  
    mvn clean test "-Dkarate.options=--tags @gorest"
