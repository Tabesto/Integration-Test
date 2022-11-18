Feature:

  Background:
    * header Content-Type = 'application/x-www-form-urlencoded'
    * header Authorization = 'profile="UsernameToken"'
    * call read('../../legacy/user-post.feature@tokenWsse')
    * header X-WSSE = userToken
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }

  Scenario: Recuperer la disponibilite des produits
    * eval sleep(40000)
    Given url apiDomain + 'api/availabilities'
    When method GET
    Then status 200