class LabelsController < ApplicationController
  
  def index
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    @label.save
  end


  private

  def label_params
    params.require(:label).permit(:name)
  end
end
