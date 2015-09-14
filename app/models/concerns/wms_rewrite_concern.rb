module WmsRewriteConcern
  extend Geoblacklight::SolrDocument

  def viewer_endpoint
    if is_nyu_restricted?
      # replace wms prefix with webauthed proxy
     	super.gsub(/.+?(?=\/geoserver)/, Settings.PROXY_URL)
#      super.prepend(Settings.PROXY_URL)
 #     super.concat('?')
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