json.array!(@my_objects) do |obj|
  json.id           obj.id
  json.short_name   obj.name
  json.description  obj.description
end