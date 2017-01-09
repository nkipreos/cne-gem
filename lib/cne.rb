require 'net/http'
require 'json'

class CNE

  def initialize(api_key)
    @base_url = 'http://cne.cloudapi.junar.com/api/v2/datastreams/'
    @api_key = api_key
  end

  def termoelectricas(limit = '50', format = 'json', raw = false)
    uri = URI(@base_url + "CENTR-TERMO/data.#{format}/?auth_key=#{@api_key}&limit=#{limit}")
    raw ? JSON.parse(Net::HTTP.get(uri)) : table_to_data(JSON.parse(Net::HTTP.get(uri))['result']['fArray'], 14)
  end

  private
  
  def table_to_data(json_table, columns)
    out = []
    h = {}
    (15..json_table.count - 1).each do |index|
      hash_index = index % 15
      h[json_table[hash_index]['fStr']] = json_table[index]['fStr']
      if hash_index == 14
	out << h
	h = {}
      end
    end
    out
  end
end
