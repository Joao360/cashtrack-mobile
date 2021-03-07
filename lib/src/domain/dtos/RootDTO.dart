class RootDTO {
  final String register;
  final String signIn;
  final String records;
  final String categories;

  RootDTO({this.register, this.signIn, this.records, this.categories});

  factory RootDTO.fromJson(Map<String, dynamic> json) {
    return RootDTO(
      register: json['userId'],
      signIn: json['id'],
      records: json['title'],
      categories: json['categories'],
    );
  }
}
