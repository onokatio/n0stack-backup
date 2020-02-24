list=$(n0cli get bs -o json \
    | jq -cr '.block_storages[]' \
    | jq -cr 'select(.state == "PROTECTED")' \
    | jq -cr '[.name, .annotations."n0core/provisioning/block_storage/request_node_name"]' \
    | sed -e 's/ictsc-sl2500-0/172.16.1.1/')

for bs in $list;do
	set -v
	echo rsync -av -e "ssh -i /fio/sl2500-root.key" root@$(echo $bs | jq -r .[1]):/var/lib/n0core/block_storage/$(echo $bs | jq -r .[0]) /fio/block_storage/
	set +v
done
