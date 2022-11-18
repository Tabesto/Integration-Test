Feature: Récuperer une entité
  Background:
    * header Authorization = token
    * header Content-Type = 'application/json'

    Scenario: Récuperer une entité
      Given url baseUrl
      And params params
      When methode GET
      Then status 200
      * def resp = response