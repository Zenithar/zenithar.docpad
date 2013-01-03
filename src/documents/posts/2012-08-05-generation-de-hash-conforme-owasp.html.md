---
layout: post
title: "Génération de Hash conforme OWASP"
date: 2012-08-05 21:05
comments: true
categories: 
 - Logiciels
tags:
 - CoffeeScript
 - OWASP
  
---

Voici un module conforme aux conseils [OWASP](https://www.owasp.org/index.php/Hashing_Java) sur le hashage des mots de passe. Il s'agit d'un module (CommonJS) codé en CoffeeScript.

Le prinicpe est simple, choisir un `algorithm`, ajouter une graine `key` utlisée pour initialiser la chaine de hashage, en y ajoutant le `message` a hasher. Suivi d'`iterations` (souvent > 1000), permettant de ce fait d'ajouter des inconnues en cas de brute force.

gist:3169823

Il suffit alors pour comparer les hash de connaitre :
  
  * L'algorithme (SHA1, SHA256, etc…)
  * La graine
  * Le nombre d'itérations
  
Ces informations devront être stockées dans la persistence, pour pouvoir être utilisées plus tard, par exemple pour la validation.
  
Biensur la validation se fait par comparaison des images issue de l'algorithme.

