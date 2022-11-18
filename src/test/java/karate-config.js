function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    apiDomain: 'https://qa1-1001.uat.tbst.me/',
    zeltyBoUrl: 'https://bo.zelty.fr/app_api/2.0/catalog/',
    apiCisDomain: 'https://cisqa1.services.uat.tbst.me',
    usernameCIS:'tabesto',
    passwordCIS:'bXckD_xTgwisQFqLRg4GTUHdQaPpoENi',
    secretZeltyHmac: '',
    secretDeliverectHmac: '',
    apiOca: 'https://oca.services.uat.tbst.me',
    mobileJWTToken: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcGkiLCJpYXQiOjE2NjY4NTkyMzgsIm5iZiI6MTY2Njg1OTIzOCwidXNlcm5hbWUiOiJhcGkiLCJkYXRhIjp7InNlbGxlciI6eyJzaXRlX25hbWUiOiJxYTE6MTAwMSJ9LCJ0YWJsZSI6W10sInVzZXIiOnsidXNlcm5hbWUiOiIwMDAwMDAwMC00ZTY5LWQwYTYtMDAzMy1jNTg3MDAzM2M1ODciLCJkZWZhdWx0X3RhYmxlX2lkIjpudWxsLCJyb2xlcyI6WyJST0xFX1RBQl9BRE1JTiIsIlJPTEVfVVNFUiJdfX0sImV4cCI6MTY2Njg2Mjg0NH0.riQArBp-Vn96Makofn4dpC3DrVVmAvaFzEvuIG5Fu5w'

  };
  if (env == 'staging') {
    // over-ride only those that need to be
    config.apiCisDomain = 'https://cisapi.services.stg.tbst.me';
    config.usernameCIS = 'tabesto';
    config.passwordCIS = '';
    config.apiOCa = 'https://oca.services.stg.tbst.me';
    config.MobileJWTToken = ''
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}