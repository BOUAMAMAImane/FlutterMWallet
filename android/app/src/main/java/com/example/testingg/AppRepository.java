package com.example.testingg;

import androidx.annotation.NonNull;

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

    public void login(@NonNull MethodCall call, MethodChannel.Result result) throws ParseException {
        String phoneNumber = call.argument("phoneNumber");
        String password = call.argument("password");
        String session = call.argument("session");
        String header = call.argument("header");





        try {

            String  loginResp = new Auth().login(phoneNumber,password,header,session);

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


        Map<String,Object>data = new HashMap<>();
        data.put("email",email);
        data.put("password",password);
        data.put("firstName",firstName);
        data.put("lastName",lastName);
        data.put("phoneNumber",phoneNumber);
        data.put("cin",cin);
        data.put("gender",gender);

        try{
            String signupResp= new Auth().register(data);
            result.success(signupResp);
        } catch (Exception e) {
            e.printStackTrace();
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
        String email = call.argument("email");
        String password = call.argument("password");
        String newPassword = call.argument("newPassword");
        String changePassword = new User().changePassword(email,password,newPassword);
        result.success(changePassword);
    }
}
