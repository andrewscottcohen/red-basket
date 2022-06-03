Rails.application.routes.draw do

  get("/url_testing_page", { :controller => "events", :action => "zoom_landing"})

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/", { :controller => "events", :action => "index" })
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Department resource:

  # CREATE
  post("/insert_department", { :controller => "departments", :action => "create" })
          
  # READ
  get("/departments", { :controller => "departments", :action => "index" })
  
  get("/departments/:path_id", { :controller => "departments", :action => "show" })
  
  # UPDATE
  
  post("/modify_department/:path_id", { :controller => "departments", :action => "update" })
  
  # DELETE
  get("/delete_department/:path_id", { :controller => "departments", :action => "destroy" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  post("/insert_venue", { :controller => "venues", :action => "create" })
          
  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  
  get("/venues/:path_id", { :controller => "venues", :action => "show" })
  
  # UPDATE
  
  post("/modify_venue/:path_id", { :controller => "venues", :action => "update" })
  
  # DELETE
  get("/delete_venue/:path_id", { :controller => "venues", :action => "destroy" })

  #------------------------------

  # Routes for the Speaker resource:

  # CREATE
  post("/insert_speaker", { :controller => "speakers", :action => "create" })
          
  # READ
  get("/speakers", { :controller => "speakers", :action => "index" })
  
  get("/speakers/:path_id", { :controller => "speakers", :action => "show" })
  
  # UPDATE
  
  post("/modify_speaker/:path_id", { :controller => "speakers", :action => "update" })
  
  # DELETE
  get("/delete_speaker/:path_id", { :controller => "speakers", :action => "destroy" })

  #------------------------------

end
