json.array!(@check_data) do |check_datum|
  json.extract! check_datum, :date_checked, :check_id, :status, :response_time
  json.url check_datum_url(check_datum, format: :json)
end
