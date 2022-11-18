Feature: Créer un user

  Background:
    * header Content-Type = 'application/json'
    * def generateTokenWSSE = Java.type('tabesto.legacy.GenerateWsseToken')

  @tokenWsse
  Scenario: Je crée un token WSSE
    Given url  apiDomain + 'api/user/user/new'
    And request {"user":{"username":"00000000-4e69-d0a6-0033-c5870033c589","isAdmin":false,"appV":"v.2.1"}}
    When method POST
    Then status 200
    * def user = response
    * def userToken = karate.read('../legacy/GenerateWsseToken.js')(response.username, response.salt)

  @tokenUser
  Scenario: Je recupeère un user
    * header X-WSSE = userToken
    * header Authorization = 'profile="UsernameToken"'
    Given url apiDomain + 'api/user/user/new'
    When method GET
    Then status 200
    * def user = response