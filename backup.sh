#!/usr/bin/zsh

export N0CLI_API_URL=grpc://172.16.1.11:20180
export N0CLI_API_ENDPOINT=172.16.1.11:20180

n0cli get bs -o json \
    | jq '.block_storages[]' \
    | jq 'select(.state == "PROTECTED")' \
    | jq -cr '[.name, .annotations."n0core/provisioning/block_storage/request_node_name"]' \
    | sed -e 's/ictsc-sl2500-0/172.16.1.1/' > json

cat json | while read line;do
	set -v
	rsync -av -e "ssh -i /fio/sl2500-root.key" root@$(echo "$line" | jq -r '.[1]'):/var/lib/n0core/block_storage/$(echo "$line" | jq -r '.[0]') /fio/block_storage/
	set +v
done

