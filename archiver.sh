#!/bin/sh
tar -czf $2_$1_backup_tar.gz $(ls -d */ | cat)