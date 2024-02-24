json.data do
  json.items do
    json.array!(@stores) do |store|
      json.id store.id
      json.user do
        json.name store.user.name
        json.image url_for(store.user.profile_image)
      end
      json.image url_for(store.food_image)
      json.name store.name
      json.description store.description
      json.address store.address
      json.latitude store.latitude
      json.longitude store.longitude
    end
  end
end