require 'sinatra/base'

class MyApp < Sinatra::Base
 
 # the following is important if you have pages in two different locations:
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "../", "views") }
  set :public, Proc.new { File.join(root, "../", "public") }

  get '/' do
    @name = %w(Amigo Oscar Viking).sample
   erb :index
  end

  get '/hello' do
    @visitor = params[:name]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
