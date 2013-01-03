---
date: '2006-05-19 16:38:04'
layout: post
slug: stage-isi-vol2
status: publish
title: Stage ISI - vol.2
wordpress_id: '51'
categories:
- General
tags:
- IUP
- Stage
---

Voila mise en place du domaine terminé (Domaine SAMBA). Un petit changement au programme suite à une découverte : je viens de mettre la main sur un bijou pour le déploiement d'application sur environnement MS, [WPKG](http://wpkg.org/) c'est un programme permettant de déployer des applications sous forme EXE, MSI (différents installeurs supportés) au login de la personne ou par le biais d'un service qui veille et interroge périodiquement un fichier XML conservant tous les profils d'installation.

Je viens de mettre en place un service de messagerie instantanée basée sur XMPP (eJabberd) pour l'entreprise. En effet, après étude il semble que les sociétés en contact avec l'entreprise utilise considérablement des moyens libres et gratuits pour communiquer. D'où la mise en place sur le domaine, connexion à LDAP pour fournir automatiquement les comptes jabber aux utilisateurs du domaine.

Enfin, ceci mettant fin à la partie administration du stage, le verrouillage des services pour protéger les machines d'accès non explicites et non autorisé sur des services en écoute (MySQL, utilisation unique en local; mauvais exemple, il n'écoute que sur une socket Unix, mais bon voila vous comprenez !) a été effectué.

J'attends des utilisateurs des retour de bugs sur les services proposés (Asterisk surtout !), maintenant.
