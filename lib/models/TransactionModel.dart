class TransactionModel {
  TransactionModel({
    required this.id,
    required this.transactionId,
    required this.emetteur,
    required this.destinataire,
    required this.dateTransaction,
    required this.message,
    required this.montant,
    required this.transactionType,
  });
  late final int id;
  late final String transactionId;
  late final String emetteur;
  late final String destinataire;
  late final String dateTransaction;
  late final String message;
  late final double montant;
  late final String transactionType;

  TransactionModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    transactionId = json['transactionId'];
    emetteur = json['emetteur'];
    destinataire = json['destinataire'];
    dateTransaction = json['date_transaction'];
    message = json['message'];
    montant = json['montant'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['transactionId'] = transactionId;
    _data['emetteur'] = emetteur;
    _data['destinataire'] = destinataire;
    _data['date_transaction'] = dateTransaction;
    _data['message'] = message;
    _data['montant'] = montant;
    _data['transactionType'] = transactionType;
    return _data;
  }
}