#!/bin/bash

brew cleanup --prune=all -s
rm -rf $(brew --cache)/*
