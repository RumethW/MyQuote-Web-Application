json.extract! author, :id, :fname, :lname, :birth_year, :death_year, :source_biography, :created_at, :updated_at
json.url author_url(author, format: :json)
