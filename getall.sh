tok=$(cat token.gh)

jq ".artifacts[].id" gh-artifacts.json > liste-id.tkt

mkdir -p out/

for a in $(cat liste-id)
do
	echo "requete $a"
	curl -L \
	  -H "Accept: application/vnd.github+json" \
      -H "Authorization: bearer $tok" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      --output out/$a \
      https://api.github.com/repos/skramm/sk-rt-R504/actions/artifacts/$a/zip

	  unzip out/$a
	  

	  if [ $? != 0 ]
	  then
		echo "erreur, fichier $a pas une archive zip!"
      fi
done
