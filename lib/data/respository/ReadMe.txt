this Directory is for calling the Get and Post methods that we defined previously in ApiClient
so for ex:
in ApiClient the Get method is take uri as a parameter and return a Response
and here we call it with different parameters as we need

apiClient.get(kpopularProductUri) ==> will return response for popularProductList only
apiClient.get(krecommended..)     ==> will return response for recommended..only
and this is the benefit from REPOSITORIES.