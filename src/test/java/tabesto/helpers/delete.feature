Feature: Supprimer une entité
  Background:
    * header Authorization = token
    * header Content-Type = 'application/json'

    Scenario: Supprimer une entité
      Given url baseUrl
      And params params
      When methode DELETE
      Then status 204