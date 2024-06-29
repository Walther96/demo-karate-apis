@csvFile
@regression
Feature: API with CSV file

  Background:
    * url 'https://reqres.in'

  @apiCSV
  Scenario Outline: <id> by CSV
    Given path '/api/users/'+<id>
    When method get
    Then status 200
      * karate.log(response.data.first_name)

      Examples:
        | read('idUsers.csv') |