#!/bin/bash

reset ()
{
  service odoo restart
}

while true; do
  inotifywait -e create /custom_addons/* && reset
done
