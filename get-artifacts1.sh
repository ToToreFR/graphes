curl -L \
   -H "Accept: application/vnd.github+json" \
   -H "Authorization: Bearer $(cat token.gh)" \
   -H "X-GitHub-Api-Version: 2022-11-28" \
   https://api.github.com/repos/ToToreFR/graphes/actions/artifacts > gh-artifacts.json

curl -L \
   -H "Accept: application/vnd.github+json" \
   -H "Authorization: Bearer $(cat token.gh)" \
   -H "X-GitHub-Api-Version: 2022-11-28" \
   https://api.github.com/repos/ToToreFR/graphes/actions/artifacts/4472106916/zip --output artifact.zip

unzip artifact.zip
