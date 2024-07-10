import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_event.dart';
import 'package:ecommerce_app/presentation/screens/on_board/sign_up_bloc/sign_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/app_pref.dart';
import '../../../../domain/api_data/api.dart';
import '../../../../domain/api_data/api_urls.dart';

class SignupBloc extends Bloc<SignupEvents,SignupState>{
  ApiHelper apiHelper;
  SignupBloc({required this.apiHelper}):super(SInitState()){
    on<SignEvent>((event, emit) async {
      try{
         var data=await apiHelper.postApi(url: GetApiUrl.REGISTRATION_URL,mapData: {'name': event.name, 'mobile_number': event.mobile_number, 'email': event.email, 'password': event.password},)as JsonResponse;
         if(data.status!){
           emit(SLoadedState());
         }else{

           emit(SErrorState(msg:'${data.message}'));
         }
      }catch(e){
        emit(SErrorState(msg: (e.toString())));
      }
    });
  }
}