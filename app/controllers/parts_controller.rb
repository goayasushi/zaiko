class PartsController < ApplicationController
  def new
    @part = Part.new
  end
end
