import 'package:get/get.dart';

class IncrementController extends GetxController{
  var count = 5.obs;
  increment() { count+5;
  update(['123']);
  }

  
}

class info{
  var name="Ali Abbas".obs;
  var age=21.obs;
}