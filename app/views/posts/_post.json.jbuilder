json.extract! post, :id, :pseudo_id, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
