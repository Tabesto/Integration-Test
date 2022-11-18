Feature: Recuperer le catalogue zelty

  Background:
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer NjMwNjpYRTUw2FijW+LJFLQly2ZKaj6zug=='

  @dishes
  Scenario: Liste de dishes
   Given url zeltyBoUrl + 'dishes'
    When method GET
    Then status 200
    * def dishes = response

  @menus
  Scenario: Liste de menus
    Given url zeltyBoUrl + 'menus'
    When method GET
    Then status 200
    * def dishes = response

  @options
  Scenario: Liste de options
    Given url zeltyBoUrl + 'options'
    When method GET
    Then status 200
    * def dishes = response

  @dishesOverride
  Scenario: Liste de dishes overrides
    Given url zeltyBoUrl + 'dishes_overrides'
    When method GET
    Then status 200
    * def dishesOverride = response

  @menuOverride
  Scenario: Liste de menus overrides
    Given url zeltyBoUrl + 'menus_overrides'
    When method GET
    Then status 200
    * def dishesOverride = response