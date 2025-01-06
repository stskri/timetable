class Public::LessonsController < ApplicationController
  def new
    @subjects = Subject.all
  end

  def create
    
  end
end
