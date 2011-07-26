class TestController < ApplicationController
  def with_extension
    @instance_var = 'OK'
    render 'with_extension', :locals => { :local_var => 'OK' }
  end
end