@graphql
@regression
Feature: GraphQL API Testing

  Background:
    * url 'https://beta.pokeapi.co/graphql/v1beta'


  @graphQL-getAbilityWithLimit
  Scenario: Get Ability with Limit
    Given def query = read('./queries/abilityList.graphql')
    And request { query: '#(query)' }
    When method post
    Then status 200
    And match response.data.pokemon_v2_ability[1].id == 2
    And match response.data.pokemon_v2_ability[1].name == "drizzle"
      * karate.log(response)


  @graphQL-getAbilityById
  Scenario: Get Ability by ID
    Given text query =
    """
      {
        pokemon_v2_ability(where: {id: {_eq: 10}})
        {
          name
        }
      }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    And match response.data.pokemon_v2_ability[0].name == "volt-absorb"
      * karate.log(response)


  @graphQL-abilityType
  Scenario Outline: Get Abilities Type by Ability Name
    Given def query = read('./queries/abilityType.graphql')
    And request { query: '#(query)', variables: '#(<abilityName>)' }
    When method post
    Then status 200
    And match response.data.pokemon_v2_abilityname[0].pokemon_v2_ability.pokemon_v2_pokemonabilities[0].pokemon_v2_pokemon.pokemon_v2_pokemontypes[0].pokemon_v2_type.name == "<pokemonType1>"
    And match response.data.pokemon_v2_abilityname[0].pokemon_v2_ability.pokemon_v2_pokemonabilities[0].pokemon_v2_pokemon.pokemon_v2_pokemontypes[1].pokemon_v2_type.name == "<pokemonType2>"
      * karate.log(response)

    Examples:
        | abilityName                    | pokemonType1 | pokemonType2 |
        |  { name : "Poison Puppeteer" } | poison       | ghost        |



  @graphQL-getRegionByID
  Scenario Outline: Get Region by ID
    Given request
      """
      {
        "query": "query MyQuery { pokemon_v2_region(where: {id: {_eq: <id>}}) { name id } }"
      }
      """
    When method post
    Then status 200
    And match response.data.pokemon_v2_region[0].name == "<name>"
      * karate.log(response)
        Examples:
          | id  | name   |
          | 10  | paldea |
          | 1   | kanto  |
          | 5   | unova  |


  @graphQL-getRegionWithQuery
  Scenario Outline: Get Region name by Queries
    Given def query = read('./queries/region.graphql')
    And request { query: '#(query)', variables: '#(<id>)' }
    When method post
    Then status 200
    And match response.data.pokemon_v2_region[0].name == "<region>"
      * karate.log(response.data)
      Examples:
        | id         | region |
        |  { id: 1 } | kanto  |
        |  { id: 2 } | johto  |

