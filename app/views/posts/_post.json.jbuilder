json.extract! post, :id, :title, :body, :source, :source_url, :user_id, :age_rating, :category, :created_at, :updated_at
json.url post_url(post, format: :json)
