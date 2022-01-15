import 'package:get/get.dart';
import 'package:klinik_app/controllers/doctor_view_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorViewController>(() => DoctorViewController());
  }
}
