class FourfuncsController < ApplicationController
    require 'unirest'
    require 'aylien_text_api'
    require 'json'

    
    
    def new
        @fourfunc = Fourfunc.new
    end
        
        
    def create
        @fourfunc = Fourfunc.new(fourfunc_params)
        
        if @fourfunc.save
            content = params[:fourfunc][:content]
            #textapi = AylienTextApi::Client.new()
   
            #output = textapi.language(text: "#{content}")
            
            
             response1 = Unirest.post "https://japerk-text-processing.p.mashape.com/phrases/",
              headers:{
                "X-Mashape-Key" => "",
                "Content-Type" => "application/x-www-form-urlencoded",
                "Accept" => "application/json"
              },
              parameters:{
                "language" => "english",
                "text" => "#{content}"
              }
              
              #outputis = response1
              #outputhash = JSON.parse(outputis)
                
            
            flash[:success] = "#{JSON.pretty_generate(JSON[response1])}"
            redirect_to new_fourfunc_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_fourfunc_path
        end
    end
    
    private 
        def fourfunc_params
           params.require(:fourfunc).permit(:content) 
        end
end