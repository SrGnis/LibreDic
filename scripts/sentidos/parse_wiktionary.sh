## needs python library xq and package jq

wget https://dumps.wikimedia.org/eswiktionary/20220520/eswiktionary-20220520-pages-meta-current.xml.bz2
bzip2 -dk eswiktionary-20220520-pages-meta-current.xml.bz2
rm eswiktionary-20220520-pages-meta-current.xml.bz2
cat eswiktionary-20220520-pages-meta-current.xml | xq . > eswiktionary.json
rm eswiktionary-20220520-pages-meta-current.xml
grep -n -m 1 "\"page\":" eswiktionary.json |sed  's/\([0-9]*\).*/\1/'
sed -i 1,148d eswiktionary.json
sed -i "$(( $(wc -l <eswiktionary.json)-3+1 )),$ d" eswiktionary.json
sed -i '1i [' eswiktionary.json
sed -i -e '$a\ ]' eswiktionary.json
mongoimport --db eswiktionary --collection palabras --type json --file eswiktionary.json --jsonArray
rm eswiktionary.json

echo "SELECT lema FROM palabras p;" > sql
mysql -u user -p LibreDic < sql > lista.csv

mongoimport --db eswiktionary --collection lista --type csv --headerline --fields lema --file lista.csv

#En mongosh
db = db.getSiblingDB("eswiktionary")
db.palabras.deleteMany({title: {$regex : ":"}})
db.palabras.aggregate( [ { $project : { _id: "$title", title : 1, text: "$revision.text.#text" } },{ $out : "result" } ] )
db.result.aggregate( [{ $lookup: { from: 'lista', localField: 'title', foreignField: 'lema', as: 'out' }}, { $match: { out: { $size: 1 } }}, { $unset: 'out' }, { $out: 'palabras_filtradas' }]  )

mongoexport --db eswiktionary --collection out --out eswiktionary.json --jsonArray --pretty
