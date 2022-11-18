package tabesto.legacy;


import com.linecorp.armeria.internal.shaded.guava.primitives.Bytes;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.TimeZone;

public class GenerateWsseToken {
    static MessageDigest md = null;
    static String nonce = "953B1769377EFD3DB522";
    public static String generateCreatedAt(Date time) {
        DateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        f.setTimeZone(TimeZone.getDefault());
    return f.format(time);
    }

    public static String generateDigest(String digestString) {
        byte byteData[] = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
            byteData = md.digest(digestString.getBytes(StandardCharsets.UTF_8));

        } catch (NoSuchAlgorithmException e) {
            e.getMessage();
        }
        return Base64.getEncoder().encodeToString(byteData);
    }
    public static String hashPassword(String user, String salt) {
        String salted = user + "password" + '{' + salt + '}';
        try {
            md = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte [] digest = md.digest(salted.getBytes(StandardCharsets.UTF_8));
        for(int i = 1; i < 5000; i++) {
            digest = Bytes.concat(digest, salted.getBytes(StandardCharsets.UTF_8));
            digest = md.digest(digest);
        }
        return Base64.getEncoder().encodeToString(digest);
    }

    public static String wsseHeader(String user, String salt) {
     String nonceEncoded = Base64.getEncoder().encodeToString(nonce.getBytes());
     String createdAt = generateCreatedAt(new Date());
     String secretHash = hashPassword(user, salt);
     String digestString = nonce + createdAt + secretHash;
     String digest = generateDigest(digestString);
     return "\"UsernameToken Username=\""+ user + "\", PasswordDigest=\"" + digest +"\", Nonce=\"" + nonceEncoded + "\", Created=\""+ createdAt +"\"";
    }
}
