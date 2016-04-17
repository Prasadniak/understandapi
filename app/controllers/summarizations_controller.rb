class SummarizationsController < ApplicationController
    require 'unirest'
    require 'aylien_text_api'

    
    
    def new
        @summarization = Summarization.new
    end
        
        
    def create
        @summarization = Summarization.new(summarization_params)
        
        if @summarization.save
            content = params[:summarization][:content]
            textapi = AylienTextApi::Client.new()
   
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
            redirect_to new_summarization_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_summarization_path
        end
    end
    
    private 
        def summarization_params
           params.require(:summarization).permit(:content) 
        end
end