class Api::V1::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @book = Book.all
    render json: @book
  end

  def show
    @book = Book.find(params[:id])
    if @book
      render json: @book
    else
      render json: { message: "book not found"}
    end
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      render json: {message: "book added successfully"}
    else
      render json: {message: "somthing wrong"}
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: {message: "book update successfully"}
    else
      render json: {message: "somthing wrong"}
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      render json: { message: "book deleted"}
    else
      render json: { message: "book not found"}
    end
  end

  private
  def book_params
    params.permit(:book_name, :author, :quantity)
  end
end
