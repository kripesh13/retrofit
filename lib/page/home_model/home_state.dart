import 'dart:io';

import 'package:api_call_with_retrofit/model/task_model.dart';
import 'package:api_call_with_retrofit/network_model/dio_injuction.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeState extends ChangeNotifier {
  HomeState() {
    getData();
  }

  File? image;

  Future<void> openImage() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      image = File(pickImage.path);
      notifyListeners();
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  TaskModel taskModel = TaskModel();
  bool isLoading = true;
  getData() async {
    await restClint.getTask().then((value) {
      taskModel = value;
      isLoading = false;
      notifyListeners();
    }).onError(
      (error, stackTrace) {
        print({error, stackTrace});
      },
    );
  }

  post() {
    restClint.postJob(nameController.text, jobController.text).then(
      (value) {
        // print(value);
        nameController.clear();
        jobController.clear();
      },
    );
  }

  updateData() {
    restClint.updateJob(252, "Test", "Developer", "derojgar").then((value) {
      print(value.name);
    });
  }

   deleteJob() {
    restClint.deleteJob(252).then((value) {
      print(value);
    });
  }

  selectImage() async {
    restClint.postImage(image!,'image').then(
      (value) {
        print(value);
      },
    );
  }
}
