Feature: Gestion de validation CIS

  Background:
    * url apiOca
    * header Content-Type = 'application/json'
    * call read('../legacy/user-post.feature@tokenWsse')
    * header Authorization = 'Bearer ' + user.onsite_core_api.token
    * print user.onsite_core_api.token


  Scenario: Recuperer menu
    * def sellerName = (apiDomain.split('\//')[1]).split('\.')[0].replace('-', ':')
    Given path '/api/v1/seller/' + sellerName +'/cache/menu'
    When method GET
    Then status 200