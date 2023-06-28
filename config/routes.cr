# require "../src/controllers/*"
# alias Env = HTTP::Server::Context

# module RestManager
#     get "/travel_plans", &->get(Env)
#     get "/travel_plans/:id", &->show(Env)
#     post "/travel_plans", &->create(Env)
#     put "/travel_plans/:id", &->update(Env)
#     delete "/travel_plans/:id", &->delete(Env)
# end