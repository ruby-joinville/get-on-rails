class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def test
    puts 'test'
  end
end
