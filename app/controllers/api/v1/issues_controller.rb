class Api::V1::IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @issue = IssueBook.all
    render json @issue
  end

  def issue
    @book = Book.find_by(book_name: params[:book_name])
    @user = User.find_by(id: params[:id])
    @issue = IssueBook.find_by(book_id: @book.id)
      if q_more_than_i(@book.quantity,@book.issueBooks.size)
        if IssueBook.create(user_id: @user.id, book_id: @book.id)
          @book.update(quantity: @book.quantity - 1)
          render json: {message: "book successfully issued"}
        else
          render json: {message: "issued error 13"}
        end
      else
        render json: {message: "no books left"}
      end
  end

  def return
    @book = IssueBook.find_by(book_id: params[:book_id])
    if @book.destroy
      render json: {message: "book return success"}
    else
      render json: {message: "book not return"}
    end
  end

  private

  def q_more_than_i(q,i)
    if(q<=i)
      return false
    else
      return true
    end
  end
end
