class BooksController < ApplicationController
  def available
    @books = Book.where(state: 0)
  end

  def reserved
    @books = Book.where(state: 1)
  end

  def bought
    @books = Book.where(state: 2)
  end

  def get_book
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.js 
    end  
  end  

  def changestatebook
    @message = ""
    @book = Book.find(params[:book_id])
    original_state = @book.state

    if original_state == 0
      sleep 2
    end

    if ( params[:new_state] == "2" && (Time.now.utc - @book.updated_at.utc).to_i > 10 )
      @message = 'El tiempo de reserva se agoto antes de comprar'
    else
      @book.state = params[:new_state]
      @book.save
    end

    @books = Book.where(state: original_state)
    respond_to do |format|
      format.js 
    end 
  end  
  
  def destroy
    @book = Book.find(params[:book_id])
    if @book.destroy
      redirect_to books_bought_path
    end
  end

end
