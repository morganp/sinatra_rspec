require 'rubygems'
require 'sinatra/base'
require 'active_record'

module MyModule
   class MyApp < Sinatra::Base
      set :raise_errors, Proc.new { false }
      set :sessions, false
      set :static, true
      set :show_exceptions, true 
      set :public, "public"


      #morganp adding this should remove the need for speratre configure blocks for ActiveRecord 
      set :root, File.dirname(__FILE__)

      configure :production, :development do
         ActiveRecord::Base.establish_connection(
            :adapter    => 'sqlite3',
            :database   => './db/test.db'
         )

         puts "DB in Normal Mode"
      end

      configure  :test do
         ActiveRecord::Base.establish_connection(
            :adapter    => 'sqlite3',
            :database   => '../db/test.db'
         )

         puts "DB in Test Mode"
      end
      puts "ENV: #{environment}"
      
      class Extension < ActiveRecord::Base
      end


      get '/' do
         ## When doing anything with Active Record even if not used the application fails to respond
        
         @thing = Extension.first
         #@thing ||= "a"
         "Hello World! #{@thing.name}"
      end
   end
end

if $0 == __FILE__
   MyModule::MyApp.run!
end
