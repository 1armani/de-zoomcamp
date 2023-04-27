https://stedolan.github.io/jq/tutorial/

# select all beautifier (-r - flag to display without double quotes)
jq -r '.' response.json | less

# select all items
jq -r '.mediaItems[]' response.json | less

# select specific
jq -r '.mediaItems[0]' response.json | less

# select only with specific value in the field "mediaMetadata/creationTime"
jq -r '.mediaItems[] | select(.mediaMetadata.creationTime=="2022-01-10T07:52:28Z")' response.json | less

# select specific fields
jq -r '.mediaItems[] | select(.mediaMetadata.creationTime=="2022-01-10T07:52:28Z") | {id:.id, filename:.filename, creationTime:.mediaMetadata.creationTime}' response.json | less

# select fields as a list of values
jq -r '.mediaItems[] | select(.mediaMetadata.creationTime=="2022-01-10T07:52:28Z") | .id, .filename, .mediaMetadata.creationTime' response.json | less

# output in one line per each entity
jq -r '.mediaItems[] | "\(.id),\(.filename),\(.mimeType),\(.mediaMetadata.creationTime)"'