
require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post "/articles" do
      article = Article.create(params[:article])
      redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do
     @article = Article.find params[:id]
     erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find params[:id]
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find params[:id]
    article.update(params[:article])
    redirect  "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect '/articles'
  end

end
