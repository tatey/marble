class TestController < ApplicationController
  # /with_extension.json -> views/test/with_extension.json.marble
  # /with_extension.xml  -> views/test/with_extension.xml.marble
  # /with_extension.yaml -> views/test/with_extension.yaml.marble
  def with_extension
    @instance_var = 'OK'
    render 'with_extension', :locals => { :local_var => 'OK' }
  end
  
  # /with_extension.(json|xml|yaml) -> views/test/without_extension.marble
  def without_extension
    @format = params[:format].to_s
  end
end