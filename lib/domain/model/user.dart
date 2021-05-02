class User {
  final String url;
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final moneyDeposits;
  final String token;
  final String tokenExpiresIn;

  User({this.firstName, this.lastName, this.moneyDeposits, this.token, this.tokenExpiresIn, this.url, this.id, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      url: json['url'],
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      moneyDeposits: json['moneyDeposits'],
      token: json['token'],
      tokenExpiresIn: json['token_expires_in'],
    );
  }
}
