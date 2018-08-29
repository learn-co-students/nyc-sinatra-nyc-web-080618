class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(name: params[:title][:name])
      # TitleFigure.create(figure_id: @figure.id, title_id: @title.id)
      @figure.titles << @title
    end

    if !params[:landmark][:name].empty? || !params[:landmark][:year].empty?
      @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year], figure_id: @figure.id)
    end
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name])
    @new_landmark = params[:figure][:landmark]
    @figure.landmarks << @new_landmark
  end

end
