class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  #CREATE new landmark
  get '/landmarks/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  #CREATE landmark # display from form
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  #READ particular landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end


  #UPDATE LANDMARK
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @titles = Title.all
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
