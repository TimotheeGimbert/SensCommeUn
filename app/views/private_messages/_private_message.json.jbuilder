json.extract! private_message, :id, :object, :content, :author_id, :author_type, :created_at, :updated_at
json.url private_message_url(private_message, format: :json)
