json.extract! user, :id, :fname, :lname, :email, :password_digest, :is_admin, :acc_string, :created_at, :updated_at
json.url user_url(user, format: :json)
