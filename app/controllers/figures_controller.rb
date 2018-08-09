class FiguresController < ApplicationController
require 'pry'

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end


  put '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      figure << Landmark.create(params[:landmark])
     end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  post '/figures/new' do
    figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      FigureTitle.create(:figure_id => figure.id, :title_id => title.id)
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.figure_id = figure.id
      landmark.save
    end
  end


end
