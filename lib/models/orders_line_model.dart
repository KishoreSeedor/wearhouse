class OrderLine {
  // ignore: prefer_typing_uninitialized_variables
  var isVisible;

  OrderLine(
      {required this.displayName,
      required this.userid,
      required this.pickingPartnerId,
      required this.pickingPartnerName,
      required this.productId,
      required this.productName,
      required this.productOnQty,
      required this.quantityDone,
      required this.pickingId,
      required this.pickingName
      // required this.visible,
      // required this.countEnter,
      });
  // String countEnter;
  // String visible;
  String displayName;
  String userid;
  String pickingPartnerId;
  String pickingPartnerName;
  String productId;
  String productName;
  String productOnQty;
  String quantityDone;
  String pickingId;
  String pickingName;
}
