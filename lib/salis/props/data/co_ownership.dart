class OwnershipPool {
  final String dateCreated;
  String? owner;
  String? ownersImage = "";
  bool isOccupied;
  final double sharePrice;
  final double equityShare;

  OwnershipPool({
    required this.dateCreated,
    this.ownersImage,
    this.owner,
    this.isOccupied = false,
    required this.sharePrice,
    required this.equityShare,
  });
}

class CoOwnershipPlan {
  final String propertyId;
  final double totalValue;
  final List<OwnershipPool> ownershipShares;

  CoOwnershipPlan({
    required this.propertyId,
    required this.totalValue,
    required int numberOfShares,
    required double sharePrice,
  }) : ownershipShares = List.generate(
          numberOfShares,
          (index) => OwnershipPool(
            dateCreated: DateTime.now().toIso8601String(),
            sharePrice: sharePrice,
            equityShare: sharePrice / totalValue,
          ),
        );

  /// Method to purchase a share
  bool purchaseShare(String buyerName, int shareIndex) {
    if (shareIndex < 0 || shareIndex >= ownershipShares.length) {
      return false; // Invalid share index
    }

    OwnershipPool share = ownershipShares[shareIndex];
    if (share.isOccupied) {
      return false; // Share already taken
    }

    share.owner = buyerName;
    share.isOccupied = true;
    return true;
  }

  /// Method to get available shares
  List<OwnershipPool> getAvailableShares() {
    return ownershipShares.where((share) => !share.isOccupied).toList();
  }
}
