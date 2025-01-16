class Public::SubjectsController < ApplicationController
  before_action :authenticate_user!
end
