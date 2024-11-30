import 'dart:io';

import 'package:api_call_with_retrofit/model/address_model.dart';
import 'package:api_call_with_retrofit/model/task_model.dart';
import 'package:api_call_with_retrofit/model/update_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('https://reqres.in/api/products')
  Future<TaskModel> getTask();
  @POST("https://reqres.in/api/users")
  Future<dynamic> postJob(
    @Field('name') String name,
    @Field("job") String job,
  );

  @PUT("https://reqres.in/api/users/{id}")
  Future<UpdateModel> updateJob(
    @Path("id") int id,
    @Field("name") String name,
    @Field("role") String role,
    @Field("job") String job,
  );

  @POST("https://api.escuelajs.co/api/v1/files/upload")
  @MultiPart()
  Future<dynamic> postImage(
     @Headers(
    <String, dynamic>{
      'Content-Type': 'multipart/form-data',
    },)
    @Part(name: 'file')
    File file,
    @Part(name: 'name') String name,
  );

  @DELETE("https://reqres.in/api/users/{id}")
  Future<dynamic> deleteJob(
    @Path("id") int id,
  );

  @GET("https://order.com.np/api/shipping-address")
  Future<AddressModel> getLocation();
}
