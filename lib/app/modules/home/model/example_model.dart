class Example {
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  Example(
      {this.id,
      this.uid,
      this.password,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.avatar,
      this.gender,
      this.phoneNumber,
      this.socialInsuranceNumber,
      this.dateOfBirth,
      this.employment,
      this.address,
      this.creditCard,
      this.subscription});

  Example.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    socialInsuranceNumber = json['social_insurance_number'];
    dateOfBirth = json['date_of_birth'];
    employment = json['employment'] != null
        ? Employment?.fromJson(json['employment'])
        : null;
    address =
        json['address'] != null ? Address?.fromJson(json['address']) : null;
    creditCard = json['credit_card'] != null
        ? CreditCard?.fromJson(json['credit_card'])
        : null;
    subscription = json['subscription'] != null
        ? Subscription?.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['social_insurance_number'] = socialInsuranceNumber;
    data['date_of_birth'] = dateOfBirth;
    if (employment != null) {
      data['employment'] = employment?.toJson();
    }
    if (address != null) {
      data['address'] = address?.toJson();
    }
    if (creditCard != null) {
      data['credit_card'] = creditCard?.toJson();
    }
    if (subscription != null) {
      data['subscription'] = subscription?.toJson();
    }
    return data;
  }
}

class Employment {
  String? title;
  String? keySkill;

  Employment({this.title, this.keySkill});

  Employment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    keySkill = json['key_skill'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['key_skill'] = keySkill;
    return data;
  }
}

class Address {
  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  Address(
      {this.city,
      this.streetName,
      this.streetAddress,
      this.zipCode,
      this.state,
      this.country,
      this.coordinates});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    streetName = json['street_name'];
    streetAddress = json['street_address'];
    zipCode = json['zip_code'];
    state = json['state'];
    country = json['country'];
    coordinates = json['coordinates'] != null
        ? Coordinates?.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city'] = city;
    data['street_name'] = streetName;
    data['street_address'] = streetAddress;
    data['zip_code'] = zipCode;
    data['state'] = state;
    data['country'] = country;
    if (coordinates != null) {
      data['coordinates'] = coordinates?.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class CreditCard {
  String? ccNumber;

  CreditCard({this.ccNumber});

  CreditCard.fromJson(Map<String, dynamic> json) {
    ccNumber = json['cc_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cc_number'] = ccNumber;
    return data;
  }
}

class Subscription {
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Subscription({this.plan, this.status, this.paymentMethod, this.term});

  Subscription.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['plan'] = plan;
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['term'] = term;
    return data;
  }
}
