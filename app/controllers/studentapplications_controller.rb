class StudentapplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :new]
  def index
  end

end
