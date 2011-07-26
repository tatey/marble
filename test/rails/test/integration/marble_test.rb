require 'test_helper'

class MarbleTest < ActionDispatch::IntegrationTest
  def test_render_json
    get '/with_extension', :format => :json
    assert_equal "{\"instance\":\"OK\",\"local\":\"OK\",\"format\":\"json\"}", response.body
  end
  
  def test_render_xml
    get '/with_extension', :format => :xml
    assert_equal "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <instance>OK</instance>\n  <local>OK</local>\n  <format>xml</format>\n</hash>\n", response.body
  end
  
  def test_render_yaml
    get '/with_extension', :format => :yaml
    assert_equal "---\ninstance: OK\nlocal: OK\nformat: yaml\n", response.body
  end
  
  def test_render_without_extension
    get '/without_extension', :format => :json
    assert_equal "{\"format\":\"json\"}", response.body
  
    get '/without_extension', :format => :xml
    assert_equal "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <format>xml</format>\n</hash>\n", response.body
    
    get '/without_extension', :format => :yaml
    assert_equal "---\nformat: yaml\n", response.body
  end
  
  def test_render_without_format
    get '/without_extension'
    assert_equal "{\"format\"=>\"\"}", response.body
  end
end