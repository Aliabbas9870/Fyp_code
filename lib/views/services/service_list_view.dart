import 'package:flutter/material.dart';
import 'package:fypapp/controller/increment_controller.dart';
import 'package:get/get.dart';

class ServiceListView extends StatelessWidget {
  // const ServiceListView({super.key});
  var inceC = Get.put(IncrementController());
  var inf = info();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text("\$ ${inceC.count}")),
              ElevatedButton(
                  onPressed: () {
                    inceC.increment();
                  },
                  child: Text("Add")),
              Obx(() => Text("${inf.name}")),
              ElevatedButton(
                  onPressed: () {
                    inf.name.value = "Ali";
                  },
                  child: Text("check")),
              SizedBox(
                height: 12,
              ),
              GetBuilder<IncrementController>(
                  id: "123",
                  init: IncrementController(),
                  builder: (control) => Text("\$ ${control.count}")),
              ElevatedButton(onPressed: () {
                // inceC.increment();
               var con=  Get.find<IncrementController>();
               con.increment();

              }, child: Text("Add")),
            ],
          ),
        ));
  }
}
