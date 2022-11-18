Feature: Gestion de validation CIS

  Background:
    * url apiCisDomain
    * header Content-Type = 'application/json'
    * header Authorization = call read('utils/basic-auth.js'){ username: usernameCIS, password:paswordCIS}



  @smoke
  Scenario Outline: Vérifier les messages d'erreur
    Given path '/event/zelty'
    And request {"event_id": "17aa4f17-6c6e-4d26-9d0b-914d87839e9a","event_name": <eventName>,"version": "v2","brand_id": 34,"restaurant_id": <restaurantId>, "data": <data>}
    When method POST
    Then status 400
    And match $.message contains "<erreurMsg>"
    Examples:
      |eventName| restaurantId | data | erreurMsg |
      |    ''   |     11        |  []    |  Invalid event payload: Object(App\\Application\\Dto\\EventPayload\\ZeltyPayload).eventName:|
      |    'product.update '   |     21        |  []    |  Unrecognized event type from the received payload |
      |    'dish.update'   |       -1     |  []    |       Invalid event payload: Object(App\\Application\\Dto\\EventPayload\\ZeltyPayload).restaurantId:\n    This value should not be blank |
      |    'dish.update'   |     21        |  []    |       'AvailailityLoader.load: Seller not found'    |
      |    'dish.update'   |     11        |  []    |       ''    |