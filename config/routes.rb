HandicapApp::Application.routes.draw do

 root 'directions#landing_page'

 get '/directions' => 'directions#get_directions', as: 'directions'

end
