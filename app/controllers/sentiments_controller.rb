class SentimentsController < ApplicationController
    require 'unirest'
    require 'aylien_text_api'

    
    
    def new
        @sentiment = Sentiment.new
    end
        
        
    def create
        @sentiment = Sentiment.new(fourfunc_params)
        
        if @sentiment.save
            content = params[:sentiment][:content]
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
            redirect_to new_sentiment_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_sentiment_path
        end
    end
    
    private 
        def sentiment_params
           params.require(:sentiment).permit(:content) 
        end
end