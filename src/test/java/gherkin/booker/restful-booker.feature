@booking
@regression
Feature: API restful-booker

    @auth
    Scenario: Create Token
      Given url baseBooker + pathAuth
      And request
      """
        {
          "username" : "admin",
          "password" : "password123"
        }
      """
      When method post
      Then status 200
        * print response


    @listBooking
    Scenario: Get list of booking
      Given url baseBooker + pathBooking
      When method get
      Then status 200

        * print response[1]


    @getBookingByParams
    Scenario: Get booking by params
      Given url baseBooker + pathBooking
      And param firstname = "Susan"
      And param lastname = "Brown"
      When method get
      Then status 200

      * print response


    @detailBooking
    Scenario Outline: Get a detail of a booking
      Given url baseBooker + pathBooking + '/<id>'
      And header Accept = "application/json"
      When method get
      Then status <responseCode>

        * print response

        Examples:
        | id   | responseCode |
        | 2    | 200          |
        | 3    | 200          |
        | 0    | 404          |


  @createBooking
  Scenario Outline: Create a booking
    Given url baseBooker + pathBooking
    And header Content-Type = "application/json"
    And header Accept = "application/json"
    And request
      """
      {
        "firstname" : "<name>",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
            "checkin" : "2023-09-05",
            "checkout" : "<dateCheckout>"
        },
          "additionalneeds" : "<additionalneeds>"
      }
      """
    When method post
    Then status <responseCode>
    And match response.booking.firstname == "<name>"
    And match response.booking.bookingdates.checkout == "<dateCheckout>"
    And match response.booking.additionalneeds == "<additionalneeds>"

      * print response

      Examples:
        | name    | dateCheckout | additionalneeds | responseCode |
        | Joe     | 2023-10-04   | Dinner          | 200          |
        | Patrick | 2023-11-04   | Lunch           | 200          |


  @ping
  Scenario: Get health check
    Given url baseBooker + pathPing
    When method get
    Then status 201

      * print response
