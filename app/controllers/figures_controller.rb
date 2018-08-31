class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name] != ""
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name:params[:landmark][:name])
      @figure.landmarks << @landmark
    end
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name] != ""
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    if params[:landmark][:name] != ""
      @landmark = Landmark.create(name:params[:landmark][:name])
      @figure.landmarks << @landmark
    end
    redirect "/figures/#{@figure.id}"
  end

end
