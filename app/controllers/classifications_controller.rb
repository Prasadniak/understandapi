class ClassificationsController < ApplicationController
    require 'unirest'
    require 'aylien_text_api'

    
    
    def new
        @classification = Classification.new
    end
        
        
    def create
        @classification = Classification.new(fourfunc_params)
        
        if @classification.save
            content = params[:classification][:content]
            textapi = AylienTextApi::Client.new(app_id: "", app_key: "")
   
            output = textapi.summarize(url: "#{content}", sentences_number: 1)
            output[:sentences].each do |sentence|
              flash[:success] = sentence
            end
            
             #response1 = Unirest.post "https://japerk-text-processing.p.mashape.com/sentiment/",
              #headers:{
               # "X-Mashape-Key" => "",
                #"Content-Type" => "application/x-www-form-urlencoded",
                #"Accept" => "application/json"
              #},
              #parameters:{
               # "language" => "english",
                #"text" => "#{content}"
              #}
            
            #flash[:success] = "#{output}"
            redirect_to new_classification_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_classification_path
        end
    end
    
    private 
        def classification_params
           params.require(:classification).permit(:content) 
        end
end