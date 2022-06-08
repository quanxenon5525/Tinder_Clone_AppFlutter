class ForyouModel {
  String title;
  String image;
  String subtitle;
  String textbutton;
  String id;

  ForyouModel(
      {this.title, this.image, this.subtitle, this.textbutton, this.id});

  ForyouModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    subtitle = json['subtitle'];
    textbutton = json['textbutton'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['subtitle'] = this.subtitle;
    data['textbutton'] = this.textbutton;
    data['id'] = this.id;
    return data;
  }
}
