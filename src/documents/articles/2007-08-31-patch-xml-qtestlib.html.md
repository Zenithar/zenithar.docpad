---
date: '2007-08-31 17:41:07'
layout: post
slug: patch-xml-qtestlib
status: publish
title: Patch XML QTestlib
wordpress_id: '152'
categories:
- KDE
tags:
- QTestLib
- tests-unitaires
- xml
---

Voila le patch vient d'être commité sur le svn de KDE, il ajoute la sortie xml issue de l'execution d'un test unitaire utilisant la bibliothèque QTestLib, les autres tests produisent leur sortie habituelle.Pour activer la sortie XML dans un fichier testname.tml, il suffit d'ordonner la construction des tests unitaires, et à l'execution de la commande "make test", les fichiers de sortie seront produit. Je travaille actuellement sur la rédaction d'un outil de mise en page de ces résultats.

