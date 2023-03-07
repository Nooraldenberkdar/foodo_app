these are the place where we store the data coming from api
it comes as a json entries so we need a class to convert these data to map and store it

and this class may take data by two types
1.take it from api directly so productModel.fromJson....
2.take it from constructor directly by return CartModel(id:value.id,name:...etc)