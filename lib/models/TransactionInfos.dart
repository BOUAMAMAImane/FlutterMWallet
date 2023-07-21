class TransactionInfos {

  String? transactionType;
  String? paiementType;
  String? countryCode;
  String? merchandName;
  String? merchandCity;
  String? merchandPhoneNumber;
  String? transactionCurrency;
  String? transactionAmount;
  String? qrCodeVersion;

  TransactionInfos.fromJson(Map<String, dynamic> json){
    transactionType = json['transaction_type'];
    paiementType = json['paiement_type'];
    countryCode = json['country_code'];
    merchandName = json['merchand_name'];
    merchandCity = json['merchand_city'];
    merchandPhoneNumber = json['merchand_phone_number'];
    transactionCurrency = json['transaction_currency'];
    transactionAmount = json['transaction_amount'];
    qrCodeVersion = json['qrCodeVersion'];
  }


}