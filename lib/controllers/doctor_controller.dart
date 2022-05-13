import 'package:get/get.dart';
import 'package:get_statemanagement/model/doctor_model.dart';

class DoctorController extends GetxController {
  List<DoctorModel> doctors = [];
  bool isLoading = false;
  String? _name;
  String? _id;
  getName(String name){
    _name=name;
    update();
  }
  getId(String id){
    _id=id;
    update();
  }
  List<DoctorModel> data = [
    DoctorModel(
      id: 1,
      name: 'Ahmed Mohamed Abdulkkadir',
      description: "balabala",
      hospital: 'Ladnaan Hospital',
      image: 'images/d1.jpg',
    ),
    DoctorModel(
      id: 2,
      name: 'Maryama abdullahi hassan',
      description: "balabala",
      hospital: 'Digfeer Hospital',
      image: 'images/d2.jpg',
    )
  ];
  getDoctors() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 3), () {
      doctors = data;
      update();
    });
    isLoading = false;
    update();
  }

  deleteDoctor(int id) {
    doctors.removeWhere((element) => element.id == id);
    update();
  }

  addDoctor() {
    doctors.add(
      DoctorModel(
        id: int.parse(_id!),
        name: _name,
        description: 'asdfadfs',
        hospital: 'ladnaan',
        image: 'images/d1.jpg'
      ),
      
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDoctors();
  }
}
