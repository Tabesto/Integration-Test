
Feature: Gestion des indisponibiltés back-office Zelty

  Background:
    * url apiCisDomain
    * header Content-Type = 'application/json'
    * header Authorization = call read('utils/basic-auth.js'){ username: usernameCIS, password:passwordCIS}


  Scenario: Gérer la désactivation du produit Cheeseburger
    * def requestZelty =  read('datas/requestProduct.json')
    * set requestZelty.data.dishes[0].disable = true
    Given path '/event/zelty'
    And request requestZelty
    When method POST
    Then status 200
    * call read('../../legacy/availability.feature')
    * def prodAvailble = karate.jsonPath(response, "$.data.products[?(@.product_id == '2')]")
    Then match prodAvailble[0].availability == "DISABLED"

  Scenario: Gérer la désactivation du formule Menu
    * def requestZelty = read('datas/requestFormule.json')
    * set requestZelty.data.menus[0].disable = true
    Given path '/event/zelty'
    And request requestZelty
    When method POST
    Then status 200
    * call read('../../legacy/availability.feature@dispoProd')
    * def prodAvailble = karate.jsonPath(response, "$.data.products[?(@.product_id == '8')]")
    Then match prodAvailble[0].availability == "DISABLED"

  Scenario: Gérer l'activation d'une option
    * def requestZelty = read('datas/requestOption.json')
    * set requestZelty.data.options[0].disable = false
    Given path '/event/zelty'
    And request requestZelty
    When method POST
    Then status 200
    * call read('../../legacy/availability.feature')
   # Then match response.data.products[*].product_id !contains 2

  Scenario: Gérer l'activation d'un produit
    * def requestZelty = read('datas/requestProduct.json')
    * set requestZelty.data.dishes[0].disable = false
    Given path '/event/zelty'
    And request requestZelty
    When method POST
    Then status 200
    * call read('../../legacy/availability.feature')
    Then match response.data.products[*].product_id !contains 2

  Scenario: Gérer l'activation d'une formule
    * def requestZelty = read('datas/requestFormule.json')
    * set requestZelty.data.menus[0].disable = false
    Given path '/event/zelty'
    And request requestZelty
    When method POST
    Then status 200
    * call read('../../legacy/availability.feature')
    Then match response.data.products[*].product_id !contains 8