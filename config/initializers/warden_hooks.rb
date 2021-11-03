Warden::Manager.after_set_user do |patient,auth,opts|
    scope = opts[:scope]
    auth.cookies.signed["#{scope}.id"] = patient.id
  end
  
  Warden::Manager.before_logout do |patient, auth, opts|
    scope = opts[:scope]
    auth.cookies.signed["#{scope}.id"] = nil
  end