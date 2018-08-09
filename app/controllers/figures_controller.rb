class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/new' do

  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    # if params landmark name length > 0 && params landmark year_completed.length  > 0
    # create new landmark
    # add new landmark id to figure landmark ids
    #
    # params[:figure][:landmark_ids].each do |landmark_id|
    #   binding.pry
    #
    #   landmark = Landmark.find(landmark_id)
    #   # @figure.landmarks << landmark
    #   landmark.figure = @figure
    # end
    #
    # params[:figure][:title_ids].each do |title_id|
    #   title = Title.find(title_id)
    #   # @figure.landmarks << landmark
    #   title.figures << @figure
    # end


    if params[:landmark][:name].length > 0 || params[:landmark][:year_completed].length > 0

      @landmark = Landmark.create(params[:landmark])
      @landmark.update(figure_id: @figure.id)
      # binding.pry
      # FigureTitle.create(@landmark.id, @title.id)
    end
    # if params title name length > 0
    # create new title
    # add new title id to figure title ids

    if params[:title][:name].length > 0
      @title = Title.create(params[:title])
      @title.figures << @figure
      @title.save
      # FigureTitle.create(figure: @figure, title: @title)
    end



    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id'  do
    # binding.pry
    @figure = Figure.find(params[:id])

    if params[:landmark][:name].length > 0 || params[:landmark][:year_completed].length > 0

      @landmark = Landmark.create(params[:landmark])
      @landmark.update(figure_id: @figure.id)
      binding.pry
      params[:figure][:landmark_ids] << @landmark.id
      # binding.pry
      # FigureTitle.create(@landmark.id, @title.id)
    end
    # if params title name length > 0
    # create new title
    # add new title id to figure title ids

    if params[:title][:name].length > 0
      @title = Title.create(params[:title])
      @title.figures << @figure
      @title.save
      # @figure.titles << @title
      # FigureTitle.create(figure: @figure, title: @title)
    end



    @figure.update(params[:figure])
    redirect "/figures/#{@figure.id}"
  end


end
