package com.example.testingg;

import androidx.annotation.NonNull;
import java.security.MessageDigest;

import com.example.mylibrarytts.Auth;
import com.example.mylibrarytts.User;

import java.security.Key;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.security.NoSuchAlgorithmException;

public class AppRepository {

    public void loadUser(@NonNull MethodCall call, MethodChannel.Result result){
        String phoneNumber = call.argument("phoneNumber");

        try {
            String user = new User().loadLoggedInUserNative(phoneNumber);

            result.success(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showEmetteurHistory(@NonNull MethodCall call, MethodChannel.Result result){
        String phoneNumber = call.argument("phoneNumber");
        try {
            String    emetteurHistory = new User().ShowHistoryEmetteur(phoneNumber);
            result.success(emetteurHistory);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   /* public void login(@NonNull MethodCall call, MethodChannel.Result result) throws ParseException {
        String phoneNumber = call.argument("phoneNumber");
        String password = call.argument("password");
        String session = call.argument("session");
        String header = call.argument("header");
        String deviceId = call.argument("deviceId");
        double latitude = call.argument("latitude");
        double longitude = call.argument("longitude");
        try {

            String loginResp = new Auth().login(phoneNumber, password, header, session, deviceId,latitude,longitude); // Passez le deviceId ici
            result.success(loginResp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
   public void login(@NonNull MethodCall call, MethodChannel.Result result) throws ParseException {
       String phoneNumber = call.argument("phoneNumber");
       String password = call.argument("password");
       String session = call.argument("session");
       String header = call.argument("header");
       String deviceId = call.argument("deviceId");
       double latitude = call.argument("latitude"); // Ajouter cette ligne pour récupérer la latitude
       double longitude = call.argument("longitude");

       try {
           String loginResp = new Auth().login(phoneNumber, password, header, session, deviceId, latitude, longitude);
           result.success(loginResp);
       } catch (Exception e) {
           e.printStackTrace();
       }
   }


    public void showDestinataireHistory(@NonNull MethodCall call, MethodChannel.Result result) {
        String phoneNumber = call.argument("phoneNumber");
        try {
            String destinataireHistory = new User().ShowHistoryDestinataire(phoneNumber);
            result.success(destinataireHistory);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void register(@NonNull MethodCall call, MethodChannel.Result result) {

        String email = call.argument("email");
        String phoneNumber = call.argument("phoneNumber");
        String password = call.argument("password");
        String firstName = call.argument("firstName");
        String lastName = call.argument("lastName");
        String cin = call.argument("cin");
        String gender = call.argument("gender");
        String deviceId = call.argument("deviceId");
        String question1 = call.argument("question1");
        String question2 = call.argument("question2");
        String question3 = call.argument("question3");

        String hashedQuestion1 = hashString(question1);
        String hashedQuestion2 = hashString(question2);
        String hashedQuestion3 = hashString(question3);
        Map<String,Object>data = new HashMap<>();
        data.put("email",email);
        data.put("password",password);
        data.put("firstName",firstName);
        data.put("lastName",lastName);
        data.put("phoneNumber",phoneNumber);
        data.put("cin",cin);
        data.put("gender",gender);
        data.put("deviceId", deviceId);
//        data.put("question1", question1);
//        data.put("question2", question2);
//        data.put("question3", question3);
        data.put("question1", hashedQuestion1);
        data.put("question2", hashedQuestion2);
        data.put("question3", hashedQuestion3);

        try{
            String signupResp= new Auth().register(data);
            result.success(signupResp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String hashString(String input) {
        try {
            MessageDigest mDigest = MessageDigest.getInstance("SHA1");
            byte[] result = mDigest.digest(input.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < result.length; i++) {
                sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    public void addTokenToUser(@NonNull MethodCall call, MethodChannel.Result result) {
        String email = call.argument("email");
        String deviceToken = call.argument("deviceToken");
        try{
            String deviceTokenResp= new User().addFcmTokenToUser(email,deviceToken);
            result.success(deviceTokenResp);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void removeFcmToken(@NonNull MethodCall call, MethodChannel.Result result) {
        String email = call.argument("email");

        try{
            String removeFcmToken= new User().removeFcmToken(email);
            result.success(removeFcmToken);
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    public void sendOtp(@NonNull MethodCall call, MethodChannel.Result result) {
        String phoneNumber = call.argument("phoneNumber");

        try{
            String sendOtp= new User().sendOtp(phoneNumber);
            result.success(sendOtp);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void verifyOtp(@NonNull MethodCall call, MethodChannel.Result result) {
        String phoneNumber = call.argument("phoneNumber");
        String otp = call.argument("otp");

        try{
            String verifyOtp= new User().verifyOtp(phoneNumber,otp);
            result.success(verifyOtp);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void sendMotsecret(@NonNull MethodCall call, MethodChannel.Result result) {
        String email = call.argument("email");
        System.out.println(email);
        try{
            String sendMotsecret= new User().sendMotsecret(email);
            result.success(sendMotsecret);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void makeVersement(MethodCall call, MethodChannel.Result result) {
        String montant = call.argument("montant");
        String destinataire = call.argument("destinataire");
        String message = call.argument("message");

        try{
            String makeVersement= new User().makeVersement(montant,destinataire,message);
            result.success(makeVersement);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void getSessionId(MethodCall call, MethodChannel.Result result) {

        try{
            Map<String,String> sessionId= new User().getSessionId();
            result.success(sessionId);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void changePassword(MethodCall call, MethodChannel.Result result) throws Exception {
        System.out.println("apprepository change password");
        String email = call.argument("email");
        String password = call.argument("password");
        String newPassword = call.argument("newPassword");
        String secret = call.argument("secret");
        String changePassword = new User().changePassword(email,password,newPassword,secret);
        result.success(changePassword);
    }
    public void makenewPassword(@NonNull MethodCall call, MethodChannel.Result result) throws Exception {
        System.out.println("apprepository make new password");

        String email = call.argument("email");
        String password = call.argument("password");
        String question1 = call.argument("question1");
        String question2= call.argument("question2");
        String question3= call.argument("question3");
        String secret = call.argument("secret");

        System.out.println(email);
        System.out.println(password);
        System.out.println(question1);
        System.out.println(question2);
        System.out.println(question3);


        String makenewPassword = new Auth().makenewPassword(email,password,question1,question2,question3,secret);
        result.success(makenewPassword);
    }
}
