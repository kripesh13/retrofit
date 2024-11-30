import 'package:api_call_with_retrofit/model/address_model.dart';
import 'package:api_call_with_retrofit/page/address_Model/address_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AddressState>(builder: (context, state, _) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<ProvinceList>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      hint: const Text('Select District'),
                      value: state.provinceList != null &&
                              state.provinceList!.isNotEmpty
                          ? state.provinceList![0]
                          : null,
                      items: state.addressModel.data?.map((e) {
                        return DropdownMenuItem(
                            value: e,
                            child: Text(e.engName ?? "Select Province"));
                      }).toList(),
                      onChanged: (ProvinceList? value) {
                        state.onChangeProvinceName(
                          value?.engName,
                          value!.districts,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<DistrictsList>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      hint: const Text('Select District'),
                      value: state.districtsList != null &&
                              state.districtsList!.isNotEmpty
                          ? state.districtsList![0]
                          : null,
                      items: state.districtsList?.map((e) {
                        return DropdownMenuItem<DistrictsList>(
                          value: e,
                          child: Text(e.npName ?? "Unknown District"),
                        );
                      }).toList(),
                      onChanged: (DistrictsList? value) {
                        state.onChangeDistrictsName(
                            value?.npName, value?.localarea);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<LocalArea>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      hint: const Text('Select Local Area'),
                      value: state.localAreaList != null &&
                              state.localAreaList!.isNotEmpty
                          ? state.localAreaList![0]
                          : null,
                      items: state.localAreaList?.map((e) {
                        return DropdownMenuItem<LocalArea>(
                          value: e,
                          child: Text(e.localName ?? "Unknown District"),
                        );
                      }).toList(),
                      onChanged: (LocalArea? value) {
                        state.onChangeLocalArea(
                            value?.localName, value?.getRouteCharge);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<GetRouteCharge>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      hint: const Text('Select Local Area'),
                      value: state.getRouteChargeList != null &&
                              state.getRouteChargeList!.isNotEmpty
                          ? state.getRouteChargeList![0]
                          : null,
                      items: state.getRouteChargeList?.map((e) {
                        return DropdownMenuItem<GetRouteCharge>(
                          value: e,
                          child: Text(e.title ?? "Unknown District"),
                        );
                      }).toList(),
                      onChanged: (GetRouteCharge? value) {
                        state.onChangeSubAddress(value?.title);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Text("No Data Found"),
                        Text(state.provinceName ?? ""),
                        Text(state.districtsName ?? ""),
                        Text(state.localAreaName ?? ""),
                        Text(state.subAddress ?? ""),
                        Text(state.zipCode ?? ""),
                      ],
                    )
                  ],
                ),
              );
      }),
    );
  }
}
