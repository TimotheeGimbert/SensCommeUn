json.extract! activity, :id, :name, :description, :activity_sector_id, :organization_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
