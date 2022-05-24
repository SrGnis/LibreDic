cat eswiktionary-20220520-pages-meta-current.xml | xq . > eswiktionary.json
grep -n -m 1 "\"page\":" eswiktionary.json |sed  's/\([0-9]*\).*/\1/'
sed -i 1,148d eswiktionary.json
sed -i "$(( $(wc -l <eswiktionary.json)-3+1 )),$ d" eswiktionary.json
sed -i '1i [' eswiktionary.json
sed -i -e '$a\ ]' eswiktionary.json
mongoimport --db eswiktionary --collection palabras --type json --file eswiktionary.json --jsonArray

#En mongosh
use eswiktionary
db.palabras.deleteMany({title: {$regex : ":"}})
db.palabras.aggregate( [ { $project : { _id: "$title", title : 1, text: "$revision.text.#text" } },{ $out : "out" } ] )

mongoexport --db eswiktionary --collection out --out eswiktionary.json --jsonArray --pretty
