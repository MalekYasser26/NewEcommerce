class BoardingModel {
  final String image ;
  final String title ;
  final String body ;

    BoardingModel({required this.image, required this.title, required this.body});

}

List<BoardingModel> BoardingModelItems = [
  BoardingModel(image: 'assets/images/My project.png', title: "BOARDING 1", body: "BODY1"),
  BoardingModel(image: 'assets/images/My project2.png', title: "BOARDING 2", body: "BODY2"),
  BoardingModel(image: 'assets/images/onboarding3blue-PhotoRoom.png-PhotoRoom.png', title: "BOARDING 3", body: "BODY3"),

];