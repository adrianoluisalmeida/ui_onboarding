var pageList = [
  PageModel(
      image: "assets/images/1.png",
      title: "Faça seu dinheiro\n crescer!",
      text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries."),
    
    PageModel(
      image: "assets/images/2.png",
      title: "Economize mais!",
      text: "Lorem ipsum is placeholder text commonly used in the graphic."),
    PageModel(
      image: "assets/images/3.png",
      title: "Gerencie sua carteira!",
      text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries."),
];

class PageModel {
  var image;
  var title;
  var text;
  
  PageModel({this.image, this.title, this.text});
}
