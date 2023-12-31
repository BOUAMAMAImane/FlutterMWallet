package com.example.mylibrarytts;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class User {
    String url = "http://192.168.137.79:8020/";
    String url1 = "http://192.168.137.79:8040/";
    OkHttpClient client = new OkHttpClient();
    public static final MediaType JSON = MediaType.get("application/json; charset=utf-8");
    Gson gson = new Gson();
    public String loadLoggedInUserNative(String phoneNumber) throws Exception {
        String LOAD_USER_PHONE_END_POINT = "wallet_war/registration/userByphone?phone_number=";

        Request request = new Request.Builder()
                .url(url1 + LOAD_USER_PHONE_END_POINT + phoneNumber)
                .build();

        try (Response response = client.newCall(request).execute()) {
            return response.body().string();

        }
    }

    public String addFcmTokenToUser(String email, String deviceToken)throws Exception {
        String DEVICE_TOKEN_ENDPOINT = "wallet_war/registration/fcm_token?user_email=";
        RequestBody body = RequestBody.create(null, new byte[]{});

        Request request = new Request.Builder()
                .url(url1 + DEVICE_TOKEN_ENDPOINT+email+"&device_token="+deviceToken)
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {
            return Objects.requireNonNull(response.body()).string();
        }
    }

    public String removeFcmToken(String email) throws Exception{
        String REMOVE_DEVICE_TOKEN_ENDPOINT = "wallet_war/registration/remove_fcm_token?user_email=";
        RequestBody body = RequestBody.create(null, new byte[]{});
        Request request = new Request.Builder()
                .url(url1 + REMOVE_DEVICE_TOKEN_ENDPOINT+email)
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {
            return Objects.requireNonNull(response.body()).string();
        }
    }
    public String sendMotsecret(String email) throws Exception{
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(60, TimeUnit.SECONDS)
                .readTimeout(60, TimeUnit.SECONDS)
                .writeTimeout(60, TimeUnit.SECONDS)
                .build();
        String SEND_MOT_SECRET_ENDPOINT = "wallet_war/registration/sendMotsecret?user_email=";
        RequestBody body = RequestBody.create(null, new byte[]{});
        Request request = new Request.Builder()
                .url(url1 + SEND_MOT_SECRET_ENDPOINT+email)
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {
            return Objects.requireNonNull(response.body()).string();
        }
    }

    public String sendOtp(String phoneNumber)throws Exception {
        String SEND_OTP_ENDPOINT = "twilio_war/lo/sendotp";
        Map<String,Object>data = new HashMap<>();
        data.put("phoneNumber",phoneNumber);
        Type gsonType = new TypeToken<HashMap>(){}.getType();

        String gsonString = gson.toJson(data,gsonType);


        RequestBody body = RequestBody.create(JSON, gsonString);
        Request request = new Request.Builder()
                .url(url+SEND_OTP_ENDPOINT)
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {


            return Objects.requireNonNull(response.body()).string();
        }
    }

    public String verifyOtp(String phoneNumber, String otp) throws Exception{
        String VERIFY_OTP_ENDPOINT = "/twilio_war/lo/verifyotp?";
        Map<String,Object>data = new HashMap<>();
        data.put("phoneNumber",phoneNumber);

        Type gsonType = new TypeToken<HashMap>(){}.getType();

        String gsonString = gson.toJson(data,gsonType);


        RequestBody body = RequestBody.create(JSON, gsonString);
        Request request = new Request.Builder()
                .url(url+VERIFY_OTP_ENDPOINT+"otp="+otp)
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {


            return Objects.requireNonNull(response.body()).string();
        }
    }
    public  Map<String,String> getSessionId() throws Exception {
        String SESSIONID_ENDPOINT = "wallet_war/registration/session";

        Request request = new Request.Builder()
                .url(url1 + SESSIONID_ENDPOINT)
                .get()
                .build();
        try (Response response = client.newCall(request).execute()) {
            Map<String,String> data = new HashMap<String,String>();
            data.put("header",response.headers().get("Set-Cookie"));
           data.put("sessionId",Objects.requireNonNull(response.body()).string());
            return data;
        }
    }
    public String changePassword(String email, String password, String newPassword,String secret) throws Exception {
        String CHANGE_PASSWORD_ENDPOINT = "wallet_war/registration/changepassword";
        System.out.println("Email: " + email);
        System.out.println("Old Password (Before Hashing): " + password);
        System.out.println("New Password (Before Hashing): " + newPassword);
        System.out.println("secret User.java : " + secret);

        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(password.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }

        String hashedPassword = sb.toString();
        byte[] newResult = mDigest.digest(newPassword.getBytes());
        StringBuffer newSb = new StringBuffer();
        for (int i = 0; i < newResult.length; i++) {
            newSb.append(Integer.toString((newResult[i] & 0xff) + 0x100, 16).substring(1));
        }
        String newHashedPassword = newSb.toString();

        Map<String, Object> data = new HashMap<>();
        data.put("email", email);
        data.put("password", hashedPassword);
        data.put("newPassword", newHashedPassword);
        data.put("secret",secret);
        Type gsonType = new TypeToken<HashMap<String, Object>>(){}.getType();
        String gsonString = gson.toJson(data, gsonType);
        RequestBody body = RequestBody.create(JSON, gsonString);

        Request request = new Request.Builder()
                .url(url1 + CHANGE_PASSWORD_ENDPOINT)
                .put(body)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                String responseBody = Objects.requireNonNull(response.body()).string();
                System.out.println("API Response: " + responseBody);
                return responseBody;
            } else {
                System.out.println("Erreur de l'API : " + response);
                return "Erreur de l'API : " + response;
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Erreur d'E/S : " + e.getMessage());
            return "Erreur d'E/S : " + e.getMessage();
        }
    }

    //    imy123stage1
    public String ShowHistoryEmetteur(String phoneNumber) throws Exception {
        String EMETTEUR_HISTORY = "transferws/showTransactionsEmetteur?phoneNumber=";
        Request request = new Request.Builder()
                .url(url + EMETTEUR_HISTORY+phoneNumber)
                .build();
        try (Response response = client.newCall(request).execute()) {
            return Objects.requireNonNull(response.body()).string();
        }

    }
    public String ShowHistoryDestinataire(String phoneNumber) throws Exception {
        String DESTINATAIRE_HISTORY = "transferws/showTransactionDestinataire?phoneNumber=";
        Request request = new Request.Builder()
                .url(url + DESTINATAIRE_HISTORY+phoneNumber)
                .build();
        try (Response response = client.newCall(request).execute()) {
            return Objects.requireNonNull(response.body()).string();
        }
    }
    public String makeVersement(String montant, String destinataire, String message)throws Exception {
        String MAKE_VERSEMENT_ENDPOINT = "transferws_war/dos/do/operation";
        Map<String,Object>data = new HashMap<>();
        data.put("operation_type","versement");
        data.put("montant",montant);
        data.put("destinataire",destinataire);
        data.put("message",message);
        Type gsonType = new TypeToken<HashMap>(){}.getType();
        String gsonString = gson.toJson(data,gsonType);
        RequestBody body = RequestBody.create(JSON, gsonString);
        Request request = new Request.Builder()
                .url(url+MAKE_VERSEMENT_ENDPOINT)
                .put(body)
                .build();
        try (Response response = client.newCall(request).execute()) {


            return Objects.requireNonNull(response.body()).string();
        }
    }
}
