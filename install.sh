#!/usr/bin/env bash

ansible-playbook -i '127.0.0.1,' playbook.yml --connection=local
