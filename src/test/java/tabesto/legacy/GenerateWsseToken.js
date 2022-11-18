function(username, salt) {
  const nonce = "953B1769377EFD3DB521";
  var Base64 = Java.type('java.util.Base64');
  const secret = "password"
  const nonceEncoded =  Base64.getEncoder().encodeToString(nonce.getBytes());

  var encoded =  Base64.getEncoder().withoutPadding().encodeToString(nonce.getBytes());
  const createdAt = new Date().toISOString().split('.')[0] + 'Z';

  const salted = username + secret + '{' + salt + '}';
  messageDigest = Java.type('java.security.MessageDigest');
  md = messageDigest.getInstance("SHA-512");
  var secretEncoded = Base64.getEncoder().encodeToString(md.digest());
  var secretHash = md.digest(salted.getBytes("UTF-8"));
  for(var i = 1; i < 5000; i++) {
     secretHash = md.digest(secretHash.concat(salted.getBytes("UTF-8")));
  }
  secretHash = Base64.getEncoder().encodeToString(secretHash);

  var digestString = nonce + createdAt + secretHash;
   md1 = messageDigest.getInstance("SHA-1");
   const digest = Base64.getEncoder().encodeToString(md1.digest(digestString.getBytes("UTF-8")));
  return `UsernameToken Username="${username}", PasswordDigest="${digest}", Nonce="${nonceEncoded}", Created="${createdAt}"`;
}

