class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :"/landmarks/new"
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params["landmark"])
      if !params[:title][:name].empty?
        title = Title.create(params["title"])
        FigureTitle.create(landmark_id: @landmark.id, title_id: title.id)
      end
      if !params[:landmark][:name].empty?
        landmark = Landmark.create(params[:landmark])
        landmark.update(landmark_id: @landmark.id)
      end
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.update(landmark_id: @landmark.id)
    end
    redirect to "/landmarks/#{@landmark.id}"
  end




end
