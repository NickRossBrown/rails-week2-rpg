class AdminController < ApplicationController
  before_action :is_admin?

  def show
    binding.pry
  end

end
