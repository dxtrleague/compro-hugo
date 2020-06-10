deploy-stg:
	./deploy.sh stg "rebuilding site `date`"

deploy-prd:
	./deploy.sh prd "rebuilding site `date`"

run-salprima:
	hugo server --config config-salprima.toml