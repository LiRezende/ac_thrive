release: bundle exec rake db:migrate
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RAC_ENV:-development}