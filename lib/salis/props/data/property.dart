import '../../../salis/props/data/cartegory.dart';
import '../../../salis/props/data/co_ownership.dart';
import '../../../salis/props/data/installment_plan.dart';
import '../../../salis/props/data/location.dart';
import '../../../salis/props/data/payment_pool.dart';

class Property {
  //BASIC DETAILS
  final String title;
  final String details;
  final Location? location;
  final String address;
  final Cartegory cartegory; // Appartment, Store, Office

  //CREDEBILITY
  int? rating = 0;
  List<String>? comments = [
    "Great Location",
  ];

  //MEDIA
  List<String>? images = [];
  String? video = "";

  double price = 0;
  bool? isPooled = false;
  bool? isTaken = false;

  //FEATURES
  bool? eletricity = true;
  bool? security = true;
  bool? water = true;

  int? bedrooms;
  int? bathrooms;

  //AMENITIES
  String? packingSpace = "2";
  String? garden = "Comon";
  String? pool = "Shared";

  //PAYMENTS
  double? outrightPlan; //Full Payment,
  InstallmentPlan? installmentPlan; //Installment Plan
  CoOwnershipPlan? coOwnershipPlan; //change it to Id of coOwnership Plan

  //OFFICIAL DOCUMENTS
  bool? registeredSurvey = true;
  bool? governmentAproved = true;
  List<String>? documents = [];

  //Property Documents
  String? siteMap = "";
  String? housePlan = "";

  Property({
    //BASIC DETAILS
    required this.title,
    required this.price,
    required this.details,
    this.location,
    required this.address,
    required this.cartegory,
    this.isTaken,

    //CREDEBILITY
    this.rating,
    this.comments,

    //MEDIA
    this.images,
    this.video,

    //FEATURES
    this.eletricity,
    this.water,
    this.security,
    this.bedrooms,
    this.bathrooms,

    //PAYMENTS
    this.installmentPlan,
    this.coOwnershipPlan,
    this.outrightPlan,

    //AMENITIES
    this.packingSpace,
    this.garden,
    this.pool,

    //official documents
    this.registeredSurvey,
    this.governmentAproved,
    this.documents,

    //property documents
    this.housePlan,
    this.siteMap,
  });
}

List<Property> myProperties = [
  Property(
      title: "3- Bed, Semi Detached",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      address: "Salis Court, Gwagwalada, central area",
      cartegory: Cartegory.homes,
      images: [
        "assets/images/props4.jpg",
        "assets/images/props6.jpg",
        "assets/images/props7.jpg",
        "assets/images/props8.jpg",
        "assets/images/props9.jpg",
        "assets/images/props11.jpg",
        "assets/images/props12.jpg",
      ],
      video: "assets/images/propsvideo.mp4",
      siteMap: "assets/images/map.jpg",
      housePlan: "assets/images/plan.jpg",
      eletricity: true,
      security: true,
      bedrooms: 4,
      bathrooms: 5,
      water: true,

      //CREDIBILITY
      rating: 4,
      comments: ["The Best Single detarched house i have seen"],
      //PAYMENT
      installmentPlan: InstallmentPlan(
        amountPaid: 500000,
        totalCost: 2000000,
        initialPayment: 500000,
        frequency: PaymentFrequency.monthly,
      )),
  Property(
      title: "Semi Detached Home",
      details:
          "Immerse yourself in luxury with this mordern apartment featuring spacious rooms, top-notch amenities, and breathtaking views. Ideal for those seeking a blend of comfort and sophistication",
      price: 70000000,
      address: "Salis Court, Gwagwalada, central area",
      cartegory: Cartegory.homes,
      images: [
        "assets/images/props16.jpg",
        "assets/images/props17.jpg",
        "assets/images/props18.jpg",
        "assets/images/props12.jpg",
        "assets/images/props4.jpg",
        "assets/images/props7.jpg",
        "assets/images/props8.jpg",
      ],
      video: "assets/images/propsvideo.mp4",
      siteMap: "assets/images/map.jpg",
      housePlan: "assets/images/plan.jpg",
      eletricity: true,
      security: true,
      bedrooms: 4,
      bathrooms: 5,
      water: true,

      //CREDIBILITY
      rating: 4,
      comments: ["The Best Single detarched house i have seen"],
      //CREDEBILITY

      //PAYMENT
      outrightPlan: 2000000),
  Property(
      title: "Self Contain-Hostel",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      address: "Salis Court, Gwagwalada, central area",
      cartegory: Cartegory.homes,
      images: [
        "assets/images/props4.jpg",
        "assets/images/props6.jpg",
        "assets/images/props7.jpg",
        "assets/images/props8.jpg",
        "assets/images/props9.jpg",
        "assets/images/props11.jpg",
        "assets/images/props12.jpg",
      ],
      video: "assets/images/propsvideo.mp4",
      siteMap: "assets/images/map.jpg",
      housePlan: "assets/images/plan.jpg",
      eletricity: true,
      security: true,
      bedrooms: 4,
      bathrooms: 5,
      water: true,

      //CREDIBILITY
      rating: 4,
      comments: ["The Best Single detarched house i have seen"],
      //CREDEBILITY

      //PAYMENT
      coOwnershipPlan: CoOwnershipPlan(
        propertyId: "propertyId",
        totalValue: 2000000,
        numberOfShares: 5,
        sharePrice: 400000,
      )),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
    installmentPlan: null,
    isTaken: true,
  ),
  Property(
    title: "Event Hall: 300 Capacity",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
    coOwnershipPlan: CoOwnershipPlan(
        propertyId: "Props001",
        totalValue: 20000000,
        numberOfShares: 6,
        sharePrice: 20),

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "5-Bed Flat",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props4.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT

    isTaken: true,
  ),
];

List<Property> newProperties = [
  Property(
      title: "Land for 4-Bed Duplex",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      address: "Salis Court, Gwagwalada, central area",
      cartegory: Cartegory.homes,
      images: [
        "assets/images/props2.jpg",
        "assets/images/props6.jpg",
        "assets/images/props7.jpg",
        "assets/images/props8.jpg",
        "assets/images/props9.jpg",
        "assets/images/props11.jpg",
        "assets/images/props12.jpg",
      ],
      video: "assets/images/propsvideo.mp4",
      siteMap: "assets/images/map.jpg",
      housePlan: "assets/images/plan.jpg",
      eletricity: true,
      security: true,
      bedrooms: 4,
      bathrooms: 5,
      water: true,

      //CREDIBILITY
      rating: 4,
      comments: ["The Best Single detarched house i have seen"],
      //CREDEBILITY

      //PAYMENT
      coOwnershipPlan: CoOwnershipPlan(
        propertyId: "propertyId",
        totalValue: 2000000,
        numberOfShares: 6,
        sharePrice: 333334,
      )),
  Property(
      title: "Land for 4-Bed Duplex",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      address: "Salis Court, Gwagwalada, central area",
      cartegory: Cartegory.homes,
      images: [
        "assets/images/props4.jpg",
        "assets/images/props6.jpg",
        "assets/images/props7.jpg",
        "assets/images/props8.jpg",
        "assets/images/props9.jpg",
        "assets/images/props11.jpg",
        "assets/images/props12.jpg",
      ],
      video: "assets/images/propsvideo.mp4",
      siteMap: "assets/images/map.jpg",
      housePlan: "assets/images/plan.jpg",
      eletricity: true,
      security: true,
      bedrooms: 4,
      bathrooms: 5,
      water: true,

      //CREDIBILITY
      rating: 4,
      comments: ["The Best Single detarched house i have seen"],
      //CREDEBILITY

      //PAYMENT
      outrightPlan: 2000000),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props3.jpg",
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props6.jpg",
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props7.jpg",
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    address: "Salis Court, Gwagwalada, central area",
    cartegory: Cartegory.homes,
    images: [
      "assets/images/props8.jpg",
      "assets/images/props9.jpg",
      "assets/images/props11.jpg",
      "assets/images/props12.jpg",
    ],
    video: "assets/images/propsvideo.mp4",
    siteMap: "assets/images/map.jpg",
    housePlan: "assets/images/plan.jpg",
    eletricity: true,
    security: true,
    bedrooms: 4,
    bathrooms: 5,
    water: true,

    //CREDIBILITY
    rating: 4,
    comments: ["The Best Single detarched house i have seen"],
    //CREDEBILITY

    //PAYMENT
  ),
];
