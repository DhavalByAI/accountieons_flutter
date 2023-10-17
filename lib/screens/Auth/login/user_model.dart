class UserData {
  int? status;
  String? msg;
  Data? data;

  UserData({this.status, this.msg, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? title;
  String? slug;
  String? email;
  String? userName;
  String? password;
  String? masterPassword;
  String? role;
  String? accountType;
  String? userType;
  String? phone;
  String? address;
  String? country;
  String? city;
  String? state;
  String? postcode;
  String? layouts;
  String? image;
  String? thumb;
  String? paypalPayment;
  String? stripePayment;
  String? paypalEmail;
  String? publishKey;
  String? secretKey;
  String? paystackPayment;
  String? paystackSecretKey;
  String? paystackPublicKey;
  String? razorpayPayment;
  String? razorpayKeyId;
  String? razorpayKeySecret;
  String? cashfreePayment;
  String? cashfreeAppId;
  String? cashfreeSecretKey;
  String? status;
  String? emailVerified;
  String? verifyCode;
  String? hit;
  String? trialExpire;
  String? createdAt;
  var oauthId;
  var oauthProvider;
  var deviceToken;
  String? ipAddress;
  String? fromMobile;
  String? businessId;
  String? busiId;
  String? businessName;
  String? businessSlug;
  String? bizNumber;
  String? businessAddress;
  String? businessLogo;
  String? countryId;
  String? currencyCode;
  String? currencySymbol;

  Data(
      {this.id,
      this.name,
      this.title,
      this.slug,
      this.email,
      this.userName,
      this.password,
      this.masterPassword,
      this.role,
      this.accountType,
      this.userType,
      this.phone,
      this.address,
      this.country,
      this.city,
      this.state,
      this.postcode,
      this.layouts,
      this.image,
      this.thumb,
      this.paypalPayment,
      this.stripePayment,
      this.paypalEmail,
      this.publishKey,
      this.secretKey,
      this.paystackPayment,
      this.paystackSecretKey,
      this.paystackPublicKey,
      this.razorpayPayment,
      this.razorpayKeyId,
      this.razorpayKeySecret,
      this.cashfreePayment,
      this.cashfreeAppId,
      this.cashfreeSecretKey,
      this.status,
      this.emailVerified,
      this.verifyCode,
      this.hit,
      this.trialExpire,
      this.createdAt,
      this.oauthId,
      this.oauthProvider,
      this.deviceToken,
      this.ipAddress,
      this.fromMobile,
      this.businessId,
      this.busiId,
      this.businessName,
      this.businessSlug,
      this.bizNumber,
      this.businessAddress,
      this.businessLogo,
      this.countryId,
      this.currencyCode,
      this.currencySymbol});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    slug = json['slug'];
    email = json['email'];
    userName = json['user_name'];
    password = json['password'];
    masterPassword = json['master_password'];
    role = json['role'];
    accountType = json['account_type'];
    userType = json['user_type'];
    phone = json['phone'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    layouts = json['layouts'];
    image = json['image'];
    thumb = json['thumb'];
    paypalPayment = json['paypal_payment'];
    stripePayment = json['stripe_payment'];
    paypalEmail = json['paypal_email'];
    publishKey = json['publish_key'];
    secretKey = json['secret_key'];
    paystackPayment = json['paystack_payment'];
    paystackSecretKey = json['paystack_secret_key'];
    paystackPublicKey = json['paystack_public_key'];
    razorpayPayment = json['razorpay_payment'];
    razorpayKeyId = json['razorpay_key_id'];
    razorpayKeySecret = json['razorpay_key_secret'];
    cashfreePayment = json['cashfree_payment'];
    cashfreeAppId = json['cashfree_app_id'];
    cashfreeSecretKey = json['cashfree_secret_key'];
    status = json['status'];
    emailVerified = json['email_verified'];
    verifyCode = json['verify_code'];
    hit = json['hit'];
    trialExpire = json['trial_expire'];
    createdAt = json['created_at'];
    oauthId = json['oauth_id'];
    oauthProvider = json['oauth_provider'];
    deviceToken = json['device_token'];
    ipAddress = json['ip_address'];
    fromMobile = json['from_mobile'];
    businessId = json['business_id'];
    busiId = json['busi_id'];
    businessName = json['business_name'];
    businessSlug = json['business_slug'];
    bizNumber = json['biz_number'];
    businessAddress = json['business_address'];
    businessLogo = json['business_logo'];
    countryId = json['country_id'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['slug'] = slug;
    data['email'] = email;
    data['user_name'] = userName;
    data['password'] = password;
    data['master_password'] = masterPassword;
    data['role'] = role;
    data['account_type'] = accountType;
    data['user_type'] = userType;
    data['phone'] = phone;
    data['address'] = address;
    data['country'] = country;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    data['layouts'] = layouts;
    data['image'] = image;
    data['thumb'] = thumb;
    data['paypal_payment'] = paypalPayment;
    data['stripe_payment'] = stripePayment;
    data['paypal_email'] = paypalEmail;
    data['publish_key'] = publishKey;
    data['secret_key'] = secretKey;
    data['paystack_payment'] = paystackPayment;
    data['paystack_secret_key'] = paystackSecretKey;
    data['paystack_public_key'] = paystackPublicKey;
    data['razorpay_payment'] = razorpayPayment;
    data['razorpay_key_id'] = razorpayKeyId;
    data['razorpay_key_secret'] = razorpayKeySecret;
    data['cashfree_payment'] = cashfreePayment;
    data['cashfree_app_id'] = cashfreeAppId;
    data['cashfree_secret_key'] = cashfreeSecretKey;
    data['status'] = status;
    data['email_verified'] = emailVerified;
    data['verify_code'] = verifyCode;
    data['hit'] = hit;
    data['trial_expire'] = trialExpire;
    data['created_at'] = createdAt;
    data['oauth_id'] = oauthId;
    data['oauth_provider'] = oauthProvider;
    data['device_token'] = deviceToken;
    data['ip_address'] = ipAddress;
    data['from_mobile'] = fromMobile;
    data['business_id'] = businessId;
    data['busi_id'] = busiId;
    data['business_name'] = businessName;
    data['business_slug'] = businessSlug;
    data['biz_number'] = bizNumber;
    data['business_address'] = businessAddress;
    data['business_logo'] = businessLogo;
    data['country_id'] = countryId;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    return data;
  }
}
