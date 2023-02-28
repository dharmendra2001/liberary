class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json:User.all
  end

  def create
    @a = User.create(user_params)
    if @a.valid?
      render json:{message:"successful"}
    else
      render json:{error:@a.errors.full_messages}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      render json: { message: "updated"}, staus: :ok
    else
      render json: { message: "user not found"}
    end
       
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy 
      render json: { message: "deleted"}, staus: :ok
    else
      render json: { message: "user not found"}
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, staus: :ok
    else
      render json: { message: "user not found"}
    end
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token =  encode_token({user:@user.id})
      render json:{user:@user,token: token},status: :ok
    end 
  end  
  private
  def user_params
    params.permit(:email,:password)
  end  
end
