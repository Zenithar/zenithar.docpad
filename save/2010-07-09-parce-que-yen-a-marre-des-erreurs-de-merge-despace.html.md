---
date: '2010-07-09 15:24:38'
layout: post
slug: parce-que-yen-a-marre-des-erreurs-de-merge-despace
status: publish
title: Parce que y'en a marre des erreurs de merge d'espace !
wordpress_id: '571'
categories:
- Développement
- Logiciels
tags:
- astyle
- git
- hook
- pre-commit
---

Voici une astuce pour vos dépôts GIT permettant de formater le code avant le commit sur le dépôt pour que tous les développeurs utilisent le même référentiel de formatage de code :

A placer dans le .git/hooks/pre-commit
```
function format_java {
 file="${1}";
 echo "${file}" | grep -ie "^.*\.java$" &gt; /dev/null

 if [ "$?" -eq 0 ] ; then
   if [ -f "${file}" ] ; then
     set -e
     astyle --mode=java --style=java "${file}"
     rm -f "${file}.orig"
     git add "${file}"
     set +e
   fi
 fi
}

for file in `git diff-index --cached --name-only HEAD` ; do
 format_java "${file}"
done
```

Voila terminé les problèmes de merge à cause du formatage ! Tout le monde aura la même mise en forme !
