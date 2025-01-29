require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:howdy)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @num = params.fetch("users_number").to_f
  @result = @num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @num = params.fetch("users_number").to_f
  @result = @num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  #@apr = params.fetch("users_apr").to_f
  #@apr = params.fetch("users_apr").to_f.round(4)
  @apr = params.fetch("users_apr").to_f
  @apr_rounded = @apr.round(4)
  @years = params.fetch("users_years").to_f
  @principal = params.fetch("users_principal").to_f
  rate = ((@apr_rounded / 100) / 12)
  total_num_payments = 12 * @years
  @result = (@principal * ((rate * (1+rate) ** total_num_payments) / (((1+rate) ** total_num_payments) - 1))).round(2)
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("users_minimum").to_f
  @max = params.fetch("users_maximum").to_f
  if @max > @min
    @result = rand(@min..@max) 
  else
    @result = nil 
  end

  erb(:random_results)
end
