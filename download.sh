#!/bin/bash

echo "Quel modèle souhaitez-vous installer ?"
echo "1) Modèle 7 (13Go)"
echo "2) Modèle 13"
echo "3) Modèle 30"
echo "4) Modèle 65"

read choix

case $choix in
    1)
        mkdir -p llama/models/7B/
        wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/cb3LtLFLz8Qt4gD/download/consolidated.00.pth
        wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/as9rXZPBFY2fXe9/download/checklist.chk
        wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/rDS3nFXS9DCdDYL/download/params.json
        wget -P llama/models/ http://nextcloud.ockap.xyz/s/7DefcwkZi9xDSMy/download/tokenizer.model
        ;;
    2)
        wget https://example.com/modele13.tar.gz
        ;;
    3)
        wget https://example.com/modele30.tar.gz
        ;;
    4)
        wget https://example.com/modele65.tar.gz
        ;;
    *)
        echo "Choix invalide"
        ;;
esac