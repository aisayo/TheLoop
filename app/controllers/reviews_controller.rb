class ReviewsController < ApplicationController
    get '/new' do
        @tracks = Track.all
        erb :'/reviews/new'
    end

    get '/reviews/:id' do
        @review = Review.find(params[:id])
        @user = User.find(session[:user_id])
        erb :'reviews/show'
    end

    post '/new' do
        binding.pry
        @review = Review.new(params[:review])
        if params[:track][:name] != ""
            @track = Track.create(params[:track]) 
        elsif params[:track][:name] != "None"

        end
        @review.track_name = @track.name
        @review.user_id=session[:user_id]

        @review.track_id=@track.id     
        @review.save
        redirect "reviews/#{@review.id}"
    end

    get '/all' do
        @reviews = Review.all
        @user = User.find(session[:user_id])       
        erb :'/reviews/all'
    end

    get '/all_user_reviews' do
        @reviews = Review.all
        @user = User.find(session[:user_id])
        erb :'/reviews/user_all'
    end
end