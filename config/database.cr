require "jennifer"
require "jennifer/adapter/postgres"

Jennifer::Config.config.from_uri("postgres://postgres:root@localhost:5432/crystal_api?sslmode=disable")

Jennifer::Config.configure do |conf|
  conf.logger = Log.for("db", :debug)
end
