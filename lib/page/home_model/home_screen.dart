import 'package:api_call_with_retrofit/page/address_Model/address_screen.dart';
import 'package:api_call_with_retrofit/page/animation/animation.dart';
import 'package:api_call_with_retrofit/page/example/example.dart';
import 'package:api_call_with_retrofit/page/home_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(builder: (context, state, _) {
      return Scaffold(
          appBar: AppBar(),
          body: state.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            state.openImage();
                          },
                          child: const Text('Pick Image')),
                      state.image == null
                          ? const Text('No Image Found')
                          : SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.file(state.image!)),
                      InkWell(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageTransition(page: Example()));
                          },
                          child: const Icon(Icons.send,size: 200,)),
                      InkWell(
                          onTap: () {
                            state.deleteJob();
                          },
                          child: const Icon(Icons.delete)),
                      TextFormField(
                        controller: state.nameController,
                      ),
                      TextFormField(
                        controller: state.jobController,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                state.post();
                              },
                              icon: const Icon(Icons.login)),
                          IconButton(
                              onPressed: () {
                                state.updateData();
                              },
                              icon: const Icon(Icons.update)),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.taskModel.data!.length,
                          itemBuilder: (context, index) {
                            var data = state.taskModel.data?[index];
                            return Card(
                              child: ListTile(
                                title: Text(data?.name ?? ""),
                                leading: Text(data?.id.toString() ?? ""),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
    });
  }
}
