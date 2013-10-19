json.array!(@checks) do |check|
  json.extract! check, :name, :url, :immediate, :start_date, :minute, :hour, :day_of_month, :month, :day_of_week
  json.url check_url(check, format: :json)
end
