Rails.application.routes.draw do
  get 'books/available'
  get 'books/reserved'
  get 'books/bought'

  root 'books#available'
   
  get 'get_book/:book_id', to: 'books#get_book', as: 'get_book'
  get 'changestatebook/:book_id/:new_state', to: 'books#changestatebook', as: 'changestatebook'
  delete 'delete/:book_id', to: 'books#destroy', as: 'destroy_book'
end
