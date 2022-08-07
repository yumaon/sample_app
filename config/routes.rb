Rails.application.routes.draw do
  get 'lists/new'

  post'lists'=>'lists#create'  #データを追加するためのルーティングを追記した

  get 'lists'=>'lists#index'

  get 'lists/:id'=>'lists#show',as:'list'
  # 詳細画面では、どの投稿データを表示するかを判別するために、投稿データのidもURLに含める。

  get 'lists/edit'

  get '/top'=>'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
