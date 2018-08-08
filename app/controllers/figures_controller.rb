class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    # Figure.create(name: params[:figure][:name], title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids])
    title = Title.create(params[:title])
    FigureTitle.create(figure_id: figure.id, title_id: title.id)

    landmark = Landmark.create(params[:landmark])
    landmark.figure_id = figure.id
    landmark.save
    # figure.titles << title
    # figure.landmarks << landmark
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    landmark.figure_id = figure.id
    landmark.save
    FigureTitle.create(figure: figure, title: title)

    redirect "/figures/#{figure.id}"

  end






end
