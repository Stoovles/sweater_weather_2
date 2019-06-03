class AntipodeService

  def initialize(params)
    @lat = params[:lat]
    @long = params[:long]
  end

  def antipode
    get_json("/api/v1/antipodes?lat=#{@lat}&long=#{@long}")
  end


  private

  def get_json(_url)
    response = conn.get(_url, api_key: "oscar_the_grouch")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
