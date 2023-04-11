#!/bin/bash
SECONDS=0
FILE=llama/models/tokenizer.model

if [ -f "$FILE" ]; then
    echo "File already exist"
    echo "    "
    echo "Which models would you like to download (230 Go in total) ? : "
    echo "1) 7B (13Go)"
    echo "2) 13B currently not working"
    echo "3) 30B (60Go)"
    echo "4) 65B currently not working"

    read choix

    case $choix in
        1) #Download file ok
            mkdir -p llama/models/7B/
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/cb3LtLFLz8Qt4gD/download/consolidated.00.pth
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/as9rXZPBFY2fXe9/download/checklist.chk
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/rDS3nFXS9DCdDYL/download/params.json
            ;;
        2)
            mkdir -p llama/models/13B/
            wget -P llama/models/13B/ 
            wget -P llama/models/13B/ 
            wget -P llama/models/13B/ 
            ;;
        3) #download file ok
            mkdir -p llama/models/30B/
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/NioJ9xifmeTGkmn/download/consolidated.00.pth
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/oPZRPzzC4kDEwmZ/download/consolidated.01.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/enT962iaA9dpjAY/download/consolidated.02.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/eConZ7S2xqsmzWr/download/consolidated.03.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/LA8iLQTBJnLPayG/download/checklist.chk 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/6pGDMfcbNxam6ga/download/params.json
            ;;
        4)
            wget https://example.com/modele65.tar.gz
            ;;
        *)
            echo "Choix invalide"
            ;;
    esac

    ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
else
    echo"downloading tokenizer.model in llama/models"
    wget -P llama/models/ http://nextcloud.ockap.xyz/s/7DefcwkZi9xDSMy/download/tokenizer.model
    echo "file downloaded"

    echo "Which models would you like to download ? (230 Go in total)"
    echo "1) 7B (13Go)"
    echo "2) 13B currently not working"
    echo "3) 30B (60Go)"
    echo "4) 65B currently not working"

    read choix

    case $choix in
        1) #Download file ok
            mkdir -p llama/models/7B/
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/cb3LtLFLz8Qt4gD/download/consolidated.00.pth
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/as9rXZPBFY2fXe9/download/checklist.chk
            wget -P llama/models/7B/ http://nextcloud.ockap.xyz/s/rDS3nFXS9DCdDYL/download/params.json
            ;;
        2)
            mkdir -p llama/models/13B/
            wget -P llama/models/13B/ 
            wget -P llama/models/13B/ 
            wget -P llama/models/13B/ 
            ;;
        3) #download file ok
            mkdir -p llama/models/30B/
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/NioJ9xifmeTGkmn/download/consolidated.00.pth
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/oPZRPzzC4kDEwmZ/download/consolidated.01.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/enT962iaA9dpjAY/download/consolidated.02.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/eConZ7S2xqsmzWr/download/consolidated.03.pth 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/LA8iLQTBJnLPayG/download/checklist.chk 
            wget -P llama/models/30B/ http://nextcloud.ockap.xyz/s/6pGDMfcbNxam6ga/download/params.json
            ;;
        4)
            wget https://example.com/modele65.tar.gz
            ;;
        *)
            echo "Choix invalide"
            ;;
    esac

    ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
fi
