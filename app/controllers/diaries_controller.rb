class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :update, :destroy]
  
  # GET /diaries
  def index
    @diaries = Diary.all
    json_response(@diaries)
  end
  
  # POST /diaries
  def create
    @diary = Diary.create!(diary_params)
    json_response(@diary, :created)
  end
  
  # GET /diaries/:id
  def show
    json_response(@diary)
  end
  
  # PUT /diaries/:id
  def update
    @diary.update(diary_params)
    head :no_content
  end
  
  # DELETE /diaries/:id
  def destroy
    @diary.destroy
    head :no_content
  end
  
  private
  
  def diary_params
    # whitelit params
    params.permit(:title, :created_by)
  end
  
  def set_diary
    @diary = Diary.find(params[:id])
  end
  
end
