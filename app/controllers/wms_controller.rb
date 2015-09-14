class WmsController < ApplicationController

  before_action :format_url
  def handle
    response = Geoblacklight::WmsLayer.new(params).get_feature_info

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def format_url
  if params['URL'] = 'http://ezproxy.library.nyu.edu:45206/geoserver/wms'
    params['URL'] = 'http://maps-restricted.nyusdr.net/geoserver/wms'
  end
 end
end