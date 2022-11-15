import '../../Models/personnel_model.dart';

class Environment {
  static String apiURL = "http://localhost:3000/api";
  static Personnel? usersession = null;
  static String getImageUrl(int id,String type){
    return "https://res.cloudinary.com/dza50jbso/image/upload/c_scale,w_500/"+id.toString()+"_"+type;
  }
}
