class ApiInterface {

  static final String baseUrl = 'http://asoebicollection.com/youtube01/';
  static final String getPosts = 'api/get_posts/?api_key=$secretApi';
  static final String getCategoryIndex = 'api/get_category_index/?api_key=$secretApi';
  static final String getCategoryPosts = 'api/get_category_posts/?api_key=$secretApi&id=';
  static final String getSearchResult = 'api/get_search_results/?api_key=$secretApi&search=';
  static final String getPrivacyPolicy = 'api/get_privacy_policy/?api_key=$secretApi';
  static final String detailVideo = 'https://www.googleapis.com/youtube/v3/videos?part=contentDetails,%20statistics,%20snippet&id=';


  static final String secretApi = ' ->> Your Apikey Youtube Here <<- ';
  
}