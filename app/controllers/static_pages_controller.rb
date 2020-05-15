class StaticPagesController < ApplicationController
  before_action :authenticate_user, only: [:secret, :explain]

  def index
  end

  def team
  end

  def contact
  end

  def secret
  end

  def explain
  end
end
