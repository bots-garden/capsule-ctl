module github.com/bots-garden/capsule-ctl

go 1.18

replace github.com/bots-garden/capsule-ctl/commons => ../commons

require (
	github.com/bots-garden/capsule-ctl/commons v0.0.0-00010101000000-000000000000
	github.com/go-resty/resty/v2 v2.7.0
)

require golang.org/x/net v0.0.0-20221004154528-8021a29435af // indirect
