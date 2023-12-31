class UserLocation
{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone
  });

  factory UserLocation.fomJson(Map<String, dynamic> json){
  final coordinates = LocationCoordinates.fromJson(json['coordinates']);
  final street = LocationStreet.fomJson(json['street']);
  final timezone = LocationTimezone.fromJson(json['timezone']);
  return UserLocation(
     city: json['city'],
     state: json['state'],
     country:json['country'],
     postcode: json['postcode'].toString(),
     street: street,
     coordinates: coordinates,
     timezone: timezone,
    );
  }
}

class LocationStreet
{
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fomJson(Map<String, dynamic> json)
  {
    return LocationStreet(number: json['number'], name: json['name']);
  }

}

class LocationCoordinates
{
  final String latitude;
  final String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});

  factory LocationCoordinates.fromJson(Map<String, dynamic> json)
  {
    return LocationCoordinates(latitude:  json['latitude'], longitude: json['longitude']);
  }

}

class LocationTimezone
{
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});

  factory LocationTimezone.fromJson(Map<String, dynamic> json)
  {
    return LocationTimezone(offset: json['offset'], description: json['description']);
  }

}