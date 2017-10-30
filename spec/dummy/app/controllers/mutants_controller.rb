class MutantsController < ApplicationController
  include MicroSessionable

  # GET /mutants
  def index
  end

  # GET /mutants/:id
  def show
    @mutant = micro_session[params[:id]]
  end
end
