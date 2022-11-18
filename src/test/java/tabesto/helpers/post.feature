Feature: Création une entité
  Background:
    * header Authorization = token
    * header Content-Type = 'application/json'

    Scenario: Création une entité
      Given url baseUrl + type
      And request req
      When methode POST
      Then assert responseStatus == 200 ||  assert responseStatus == 201