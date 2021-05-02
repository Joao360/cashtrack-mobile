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
    var user = json['user'];
    return User(
      url: user['url'],
      id: user['id'],
      email: user['email'],
      firstName: user['first_name'],
      lastName: user['last_name'],
      moneyDeposits: user['moneyDeposits'],
      token: user['token'],
      tokenExpiresIn: user['token_expires_in'],
    );
  }
}
