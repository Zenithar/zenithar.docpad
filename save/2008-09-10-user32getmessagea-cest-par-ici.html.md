---
date: '2008-09-10 20:29:43'
layout: post
slug: user32getmessagea-cest-par-ici
status: publish
title: User32::GetMessageA, c'est par ici !
wordpress_id: '313'
categories:
- Sécurité
tags:
- dll
- exploits
- Function
- gina
- hook
- intercept
---

Voici un article paru sur le site "[The Ethical Hacker Network](http://www.ethicalhacker.net/)", traitant des possibilités d'interceptions d'appels systèmes.

Cela consiste à construire une bibliothèque portant le même nom, et rediriger les appels vers la bilbiothèque originale. Ce n'est pas la première fois que l'ont voit ça, avec les keyloggers qui interceptent les appels d'ouvertures de sessions via gina.dll.

Certains trainers / hacks utilisent cette technique pour interagir avec l'application sans modifier / patcher une seule opcode ! Via direct3d8.dll ou opengl32.dll par exemple pour les wallhacks ^^

[Article source](http://www.ethicalhacker.net/content/view/207/1/)
