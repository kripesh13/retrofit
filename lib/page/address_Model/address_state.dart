import 'package:api_call_with_retrofit/model/address_model.dart';
import 'package:api_call_with_retrofit/network_model/rest_client.dart';
import 'package:flutter/material.dart';

import '../../network_model/dio_injuction.dart';

class AddressState extends ChangeNotifier {
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  String? provinceName;
  String? districtsName;
  String? localAreaName;
 String?  subAddress;
  String? zipCode;


  List<ProvinceList>? provinceList = [];

  List<DistrictsList>? districtsList = [];

List<GetRouteCharge> ?getRouteChargeList = [];
  List<LocalArea>? localAreaList = [];


  onChangeProvinceName(
      String? provinceName, List<DistrictsList>? districtsList) {
    if (this.provinceName == null) {
      this.districtsList = districtsList;
      print(this.districtsList?.length);

      notifyListeners();
    } else if (this.provinceName != provinceName) {
      this.districtsList = null;
      this.districtsList = [];

      print(this.districtsList?.length);

      this.districtsList = districtsList;
      print(this.districtsList?.length);

      notifyListeners();
    }
    this.provinceName = provinceName;
    onChangeDistrictsName(districtsList?.first.npName, districtsList?.first.localarea);
    notifyListeners();
  }

  onChangeDistrictsName(String ? val,List<LocalArea> ? localArea) {
    districtsName = val;
    localAreaList = localArea;
    onChangeLocalArea(localArea?.first.localName , localArea?.first.getRouteCharge );
    notifyListeners();
  }

  onChangeLocalArea(String?name , List<GetRouteCharge>? area){
    localAreaName = name;
    getRouteChargeList = area;
    zipCode = area?.first.zipCode;
    notifyListeners();

  }


  onChangeSubAddress(String ? name){
    subAddress = name;
    notifyListeners();
  }

  AddressState() {
    getLocation();
  }

  AddressModel addressModel = AddressModel();
  getLocation() {
    setLoading(true);
    restClint.getLocation().then(
      (value) {
        addressModel = value;
        onChangeProvinceName(value.data?.first.engName ?? "", value.data?.first.districts ?? []);
        provinceList = value.data;
        notifyListeners();
      },
    ).onError(
      (error, stackTrace) {},
    );
    setLoading(false);
  }
}
