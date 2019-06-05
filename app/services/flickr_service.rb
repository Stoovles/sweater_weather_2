class FlickrService
  def initialize(lat_lng)
    @lat = lat_lng[:lat]
    @lng = lat_lng[:lng]
  end

  def photo_info
    get_json
  end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body.gsub(/jsonFlickrApi/, '').tr('(', '').tr(')', ''), symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.flickr.com/services/rest/') do |f|
      f.adapter Faraday.default_adapter
      f.params[:api_key] = ENV['FLICKR_API_KEY']
      f.params[:content_type] = 1
      f.params[:geo_context] = 2
      f.params[:method] = "flickr.photos.search"
      f.params[:tags] = "skyline"
      f.params[:lat] = @lat
      f.params[:lon] = @lng
      f.params[:format] = "json"
      f.params[:radius] = 32
      f.params[:per_page] = 1
    end
  end
end
