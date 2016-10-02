json.array!(@parties) do |party|
  json.extract! party, :id, :party_name, :accomodation_name, :accomodation_address, :notes
  json.url party_url(party, format: :json)
end
