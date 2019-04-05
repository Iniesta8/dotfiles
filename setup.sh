#!/bin/sh

echo "Installing dotfiles..."
echo "Creating symlinks in user's home directory..."

ddir="$(dirname $(realpath -s $0))"

err=0
for entry in $ddir/{*,.*}; do
  be="$(basename $entry)"

  case "$be" in
    "README.md"|"setup.sh"|"."|".."|".git"|".gitignore"|".config")
      continue
      ;;
    *)
      echo Symlinking ~/"$be" --\> "$entry"
      ln -sn "$entry" ~/"$be"
      ret=$?
      err=$(expr $err + $ret)
      ;;
  esac
done

echo ""
if [ $err -ne 0 ] ; then
  echo "Install of dotfiles done, but error(s) occured!"
else
  echo "Install of dotfiles finished successfully."
fi
exit $err

