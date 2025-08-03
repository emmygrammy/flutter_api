class UserLocation {
  final UserLocationStreet street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final UserLocationCoordinates coordinates;
  final UserLocationTimezone timezone;

  UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      street: UserLocationStreet.fromJson(json['street'] ?? {}),
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      postcode: json['postcode'].toString(),
      coordinates: UserLocationCoordinates.fromJson(json['coordinates'] ?? {}),
      timezone: UserLocationTimezone.fromJson(json['timezone'] ?? {}),
    );
  }
}

class UserLocationStreet {
  final int number;
  final String name;

  UserLocationStreet({
    required this.number,
    required this.name,
  });

  factory UserLocationStreet.fromJson(Map<String, dynamic> json) {
    return UserLocationStreet(
      number: json['number'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class UserLocationCoordinates {
  final String latitude;
  final String longitude;

  UserLocationCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory UserLocationCoordinates.fromJson(Map<String, dynamic> json) {
    return UserLocationCoordinates(
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }
}

class UserLocationTimezone {
  final String offset;
  final String description;

  UserLocationTimezone({
    required this.offset,
    required this.description,
  });

  factory UserLocationTimezone.fromJson(Map<String, dynamic> json) {
    return UserLocationTimezone(
      offset: json['offset'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
