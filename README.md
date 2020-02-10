# Mag Claims Telegram notifications

Simple script to pull mag_claims from XC DB and send notifications to Telegram PM/Group/Channel using [telegram-send](https://github.com/rahiel/telegram-send)

## Installation
Use APT to install python-pip

```bash
sudo apt install python-pip
```
Use [pip](https://pip.pypa.io/en/stable/) to install telegram-send.

```bash
pip install telegram-send
```
Clone the repo or download it to your desired location
Edit claims.sh and change the path for "OLD" "NEW" "OUT"


## *

The script is pulling the mag_claims table from XC Database and adds it to $OLD file, then using cmp compares the files $OLD > $NEW. If the files are different it adds the extra lines to $OUT, sends the message using telegram-send, adds the new lines to $NEW (to avoid getting the same claims again) and clears the $OUT

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GNU General Public License v3.0](https://github.com/alexxxonline/xc-claims-telegram/blob/master/LICENSE)