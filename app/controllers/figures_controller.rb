class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/new"
  end

  post '/figures/new' do
    @figure = Figure.create(params["figure"])
      if !params[:title][:name].empty?
        title = Title.create(params["title"])
        FigureTitle.create(figure_id: @figure.id, title_id: title.id)
      end
      if !params[:landmark][:name].empty?
        landmark = Landmark.create(params[:landmark])
        landmark.update(figure_id: @figure.id)
      end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params[:title][:name].empty?
      title = Title.create(params["title"])
      FigureTitle.create(figure_id: @figure.id, title_id: title.id)
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.update(figure_id: @figure.id)
    end
    redirect to "/figures/#{@figure.id}"
  end




end
