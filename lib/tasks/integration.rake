INTEGRATION_TASKS = %w(
  jumpup:heroku:add_remote
  jumpup:heroku:check
  jumpup:heroku:lock
  integration:start
  integration:bundle_install
  db:migrate
  spec
  integration:coverage_verify
  integration:finish
  jumpup:heroku:deploy
  jumpup:heroku:unlock
)