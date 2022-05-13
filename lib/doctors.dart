import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_statemanagement/controllers/doctor_controller.dart';
import 'package:get_statemanagement/model/doctor_model.dart';

class Doctors extends StatelessWidget {
  Doctors({Key? key}) : super(key: key);
  final controller = Get.put(DoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Get Statemanagement',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.cyan,
      ),
      body: GetBuilder<DoctorController>(
        builder: (cont) {
          if (cont.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (cont.doctors.isEmpty) {
            return const Center(child: Text('No Doctors Found'));
          } else {
            return ListView.builder(
              itemCount: cont.doctors.length,
              itemBuilder: (context, index) =>
                  DoctorCard(doctor: cont.doctors[index]),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Doctor'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    GetBuilder<DoctorController>(builder: (cont) {
                      return TextField(
                        onChanged: (value) => cont.getId(value),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'ID'),
                      );
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                    GetBuilder<DoctorController>(builder: (cont) {
                      return TextField(
                        onChanged: (value) => cont.getName(value),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'NAME'),
                      );
                    }),
                  ],
                ),
              ),
              actions: [
                GetBuilder<DoctorController>(builder: (cont) {
                  return TextButton(
                    onPressed: () {
                      cont.addDoctor();
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  );
                })
              ],
            ),
          );
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete'),
            actions: [
              GetBuilder<DoctorController>(builder: (cont) {
                return TextButton(
                  onPressed: () {
                    cont.deleteDoctor(doctor.id!);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        );
      },
      leading: CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage(doctor.image ?? ""),
      ),
      title: Text(doctor.name ?? ""),
      subtitle: Text(doctor.hospital ?? ""),
    );
  }
}
