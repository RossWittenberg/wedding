json.array!(@guests) do |guest|
  json.extract! guest, :id, :first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :country, :phone_number, :status, :std_sent, :invite_sent
  json.url guest_url(guest, format: :json)
end
