class Root {
  final String register;
  final String signIn;
  final String records;
  final String categories;

  Root({this.register, this.signIn, this.records, this.categories});

  factory Root.fromJson(Map<String, dynamic> json) {
    return Root(
      register: json['userId'],
      signIn: json['id'],
      records: json['title'],
      categories: json['categories'],
    );
  }
}
