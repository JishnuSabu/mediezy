

// final sl = ServiceLocator();

// class ServiceLocator {

//  final Map<Type,dynamic> _services={};

//  void register<T>(
//  dynamic service,
//  ){

//    _services[T]=service;

//  }

//  T get<T>(){

//    return _services[T];

//  }

// }

// Future<void> initDependencies()
// async{

//  /*
//  ----------------
//  Core
//  ----------------
//  */

//  sl.register<ApiClient>(
//  ApiClient()
//  );

//  /*
//  ----------------
//  Repository
//  ----------------
//  */

//  sl.register<AuthRepository>(

//  AuthRepository(

//  apiClient:
//  sl.get<ApiClient>()

//  ),

//  );

// }