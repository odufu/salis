import 'package:cicdtest/salis/props/data/payment_pool.dart';

class Property {
  //BASIC DETAILS
  final String title;
  final String details;
  final String location;
  final String propType; // Appartment, Store, Office

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
  String? paymentPlan = "Outright"; //Weekly, Monthly, yearly
  double? instalmentPaid = 0;
  double? installmentUnit = 0;
  String? nextPaymentDueDate;
  List<PaymentPool>? pools = [];

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
    required this.location,
    required this.propType,
    this.isPooled,
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
    this.paymentPlan,
    this.instalmentPaid,
    this.installmentUnit,
    this.nextPaymentDueDate,
    this.pools,

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
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Semi Detached Home",
    details:
        "Immerse yourself in luxury with this mordern apartment featuring spacious rooms, top-notch amenities, and breathtaking views. Ideal for those seeking a blend of comfort and sophistication",
    price: 70000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Apartment",
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
    paymentPlan: "Weekly",
    instalmentPaid: 60000000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Self Contain-Hostel",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Event Hall: 300 Capacity",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "5-Bed Flat",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
  Property(
    title: "Salis Homes Stead",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    paymentPlan: "Monthly",
    instalmentPaid: 25000,
    installmentUnit: 25000,
    isTaken: true,
    nextPaymentDueDate: DateTime(2019, 12, 30, 20, 10, 30).toString(),
    isPooled: false,
  ),
];

List<Property> newProperties = [
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    isTaken: false,
    isPooled: false,
  ),
  Property(
      title: "Land for 4-Bed Duplex",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      location: "Salis Court, Gwagwalada, central area",
      propType: "Home Stead",
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
      isTaken: false,
      isPooled: true,
      pools: dummyPools),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    isTaken: false,
    isPooled: false,
  ),
  Property(
      title: "Land for 4-Bed Duplex",
      details:
          "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
      price: 2000000,
      location: "Salis Court, Gwagwalada, central area",
      propType: "Home Stead",
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
      isTaken: false,
      isPooled: true,
      pools: dummyPools),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    isTaken: false,
    isPooled: false,
  ),
  Property(
    title: "Land for 4-Bed Duplex",
    details:
        "The very best of comfort in homes as engeneered with the mindset of reliability and maximum comfort",
    price: 2000000,
    location: "Salis Court, Gwagwalada, central area",
    propType: "Home Stead",
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
    isTaken: false,
    isPooled: true,
  ),
];
