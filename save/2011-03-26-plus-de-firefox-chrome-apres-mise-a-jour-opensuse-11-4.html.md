---
date: '2011-03-26 13:06:08'
layout: post
slug: plus-de-firefox-chrome-apres-mise-a-jour-opensuse-11-4
status: publish
title: Plus de Firefox, Chrome après mise à jour OpenSuSE 11.4 ?
wordpress_id: '728'
categories:
- General
tags:
- chrome
- Firefox
- GTK
- OpenSuSE
---

J'ai effectué la mise à jour d'OpenSuSE 11.3 -> 11.4 par le processus de mise à jour depuis le DVD d'installation, j'ai eu un petit soucis par la suite plus aucune application GTK ne fonctionnait correctement (heureusement que je suis sous KDE ^^).

``` bash
zigurath:~ # chromium
/usr/lib64/chromium/chromium: symbol lookup error: /usr/lib64/libgdk-x11-2.0.so.0: undefined symbol: g_source_set_name

zigurath:~ # firefox
/usr/lib64/firefox/firefox: symbol lookup error: /usr/lib64/libgdk-x11-2.0.so.0: undefined symbol: g_source_set_name
```

Même la réinstallation de l'environnement GTK n'y faisait rien ! Après investigation, cela provenait d'une double référence à l'environnement GTK de versions différentes.

Les lirairies étaient installées dans /usr/lib64 et /usr/local/lib64, toutes les deux renseignées dans le fichier ld.so.conf.

J'ai donc supprimé les librairies du répertoire /usr/local/lib64 (moins récentes), et voila !

Tout ça pour dire, qu'il vaut mieux faire une installation propre à chaque mise à jour majeure en utilisant une partition particulière pour le répertoire /home contenant profil et configuration des utilisateurs.

