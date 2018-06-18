class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

 get "/recipes" do
   erb :index
 end

 get "/recipes/new" do
   erb :new
 end

 post "/recipes" do
   @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
   redirect to "/recipes/#{@recipe.id}"
 end

 get "/recipes/:id" do
   @recipe = Recipe.find(params[:id])
   erb :show
 end

 post "/recipes/:id/delete" do
   @recipe = Recipe.find(params[:id])
   @recipe.delete
   redirect to "/recipes"
 end

 get "/recipes/:id/edit" do
   @recipe = Recipe.find(params[:id])
   erb :edit

  post "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.title = params[:title]
    @recipe.content = params[:content]
    @recipe.save
    redirect to "/recipes/#{recipe.id}"
  end

end
