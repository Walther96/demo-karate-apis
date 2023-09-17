@gorest
@regression
Feature: API Gorest

  @getByResources
  Scenario Outline: Get by <resource>
    Given url baseGorest + "<resource>"
    When method get
    Then status 200
     * print response[1].id

      Examples:
        | resource |
        | users    |
        | posts    |
        | comments |
        | todos    |


  @getUserByID
  Scenario Outline: Get User by ID
    Given url baseGorest + "<resource>"
    And method get
     * def userId = response[1].id
    When url baseGorest + "<resource>/" + userId
    And header Authorization = "Bearer "+ tokenGorest
    And method get
    Then status 200
    And match response.id == userId
      * print response

      Examples:
        | resource |
        | users    |


  @createUser
  Scenario Outline: Create User
    * def name = Java.type('gherkin.gorest.Random').getName();
    * def email = Java.type('gherkin.gorest.Random').getEmail();

    Given url baseGorest + "<resource>"
    And header Authorization = "Bearer "+ tokenGorest
    And request
      """
        {
          "name": '#(name)',
          "gender": 'male',
          "email": '#(email)',
          "status": 'active'
        }
      """
    When method post
    Then status 201
    And match response.name == "#(name)"
    And match response.email == "#(email)"
      * print response

      Examples:
        | resource |
        | users    |


  @updateUser
  Scenario Outline: Update User
    * def email = Java.type('gherkin.gorest.Random').getEmail();

    Given url baseGorest + "<resource>"
    And method get
      * def userId = response[1].id
    When url baseGorest + "<resource>/" + userId
    And header Authorization = "Bearer "+ tokenGorest
    And request
      """
        {
          "email": '#(email)',
        }
      """
    And method patch
    Then status 200
    And match response.email == "#(email)"
    And match response.gender contains "<gender>"
      * print response

      Examples:
        | resource | gender |
        | users    | male   |


  @deleteUser
  Scenario Outline: Delete User
    Given url baseGorest + "<resource>"
    And method get
      * def userId = response[1].id
    When url baseGorest + "/users/" + userId
    And header Authorization = "Bearer "+ tokenGorest
    And method delete
    Then status 204

    Examples:
      | resource |
      | users    |

