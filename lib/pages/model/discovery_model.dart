class DiscoveryModel {
  String title;
  String image;
  String subtitle;
  String id;

  DiscoveryModel({this.title, this.image, this.subtitle, this.id});

  DiscoveryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    subtitle = json['subtitle'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['subtitle'] = this.subtitle;
    data['id'] = this.id;
    return data;
  }
}
