require 'open-uri'
str = "\x12\x34\x56\x78\x9a\xbc\xde\xf1\x23\x45\x67\x89\xab\xcd\xef\x12\x34\x56\x78\x9a".force_encoding('ASCII-8BIT')

module WmsRewriteConcern
  extend Geoblacklight::SolrDocument

  def viewer_endpoint
    if is_nyu_restricted?
    	'http://ezproxy.library.nyu.edu:2048/login?url=http://maps-restricted.nyusdr.net/geoserver/nyu_sdr/wms?'
      # replace wms prefix with webauthed proxy
#     	super.gsub(/.+?(?=\/geoserver)/, Settings.PROXY_URL)
#      super.prepend(Settings.PROXY_URL)
#      super.concat('?')
    else
      super
    end
  end

  def is_nyu_restricted?
    nyu? && restricted?
  end

  def nyu?
    fetch(:dct_provenance_s).downcase == 'nyu'
  end
end