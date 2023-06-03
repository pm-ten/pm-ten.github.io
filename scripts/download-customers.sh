readarray -t images < <(curl http://www.pm10-ambiente.com/clienti --silent | awk 'BEGIN { FS="src=\"/images/loghi/|\""; } /src="\/images\/loghi/ { sub(/&amp;/,"_"); print $2 }')
readarray -t titles < <(curl http://www.pm10-ambiente.com/clienti --silent | awk -F'<h6>|</h6>'  '/<h6>/ { sub(/&amp;/,"_"); print $2 }')
readarray -t urls < <(curl http://www.pm10-ambiente.com/clienti --silent | awk -F'<p><a href="|" target="_blank"|">Visita il sito</a>'  '/<p>/ { print $2 }')

customers_count=${#images[@]}

for (( i=0; i < customers_count; i++ )); do 
    curl "http://www.pm10-ambiente.com/images/loghi/${images[$i]}" -o "./media/customers/${images[$i]}" -s
done

echo "# Customers" > ./_data/customers.yaml
for (( i=0; i < customers_count; i++ )); do 
    echo "-" >> ./_data/customers.yaml
    echo "  image: media/customers/${images[$i]}" >> ./_data/customers.yaml
    echo "  title: \"${titles[$i]}\"" >> ./_data/customers.yaml
    echo "  url: \"${urls[$i]}\"" >> ./_data/customers.yaml
done

