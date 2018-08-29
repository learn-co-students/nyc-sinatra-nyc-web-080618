class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end # figures route

  get '/figures/new' do
    erb :"figures/new"
  end # new figure route

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect "figures/#{@figure.id}"
  end # post figures route

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end #

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id]) #define variable to edit
    @figure.update(params[:figure]) #assign new attributes

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save #saves new figure or returns false if unsuccessful
    redirect "/figures/#{@figure.id}" #redirect back to figures index page
  end


end # class end
