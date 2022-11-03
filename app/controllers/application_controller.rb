class ApplicationController < Sinatra::Base

  # add routes
set :default_content_type, 'application/json'

 get '/' do
  `<h1>Welcome to our store</h1>`
 end
get '/bakeries' do
  bakery = Bakery.all 
  bakery.to_json(include: :baked_goods)
end

get  '/bakeries/:id' do
  bakery = Bakery.find(params[:id])
  bakery.to_json(include: :baked_goods)
end

get '/baked_goods/by_price' do 
  baked_goods = BakedGood.order(price: :desc)
  baked_goods.to_json
end

get '/baked_goods/most_expensive' do 
  baked_good = BakedGood.order(price: :desc).limit(1)
  baked_good.to_json
end

end
