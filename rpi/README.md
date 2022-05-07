# raspi fan control

- `sudo ln -s ~/dotfiles/rpi/raspi-fan.service /etc/systemd/system/`
- `sudo systemctl daemon-reload; sudo systemctl restart raspi-fan.service; sudo systemctl status raspi-fan.service`
