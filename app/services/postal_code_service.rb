
require 'httparty'
class PostalCodeService
  def self.get_address(postal_code)
    #zipcode = "0600001"  # Replace this with any Japanese postal code

    response = HTTParty.get("https://zipcloud.ibsnet.co.jp/api/search?zipcode=#{postal_code}")
    if response.success?
			data = response.parsed_response["results"].first
			parsed_response = JSON.parse(response)

			address = {
					state: parsed_response['results'][0]['address1'],   # Example: "北海道"
					city: parsed_response['results'][0]['address2'],    # Example: "札幌市中央区"
					area: parsed_response['results'][0]['address3'],    # Example: "北一条西"
			}
			return address
    else
			return nil
    end
  end   
end     