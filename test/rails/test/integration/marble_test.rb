require 'test_helper'

class MarbleTest < ActionDispatch::IntegrationTest
  def test_render_json
    get '/', :format => :json
    assert_equal({ 'instance' => 'OK', 'local' => 'OK' }, JSON.parse(response.body))
  end
  
  def test_render_xml
    get '/', :format => :xml
    assert_equal("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <instance>OK</instance>\n  <local>OK</local>\n</hash>\n", response.body)
  end
  
  def test_render_yaml
    get '/', :format => :yaml
    assert_equal({ 'instance' => 'OK', 'local' => 'OK' }, YAML.load(response.body))
  end
end