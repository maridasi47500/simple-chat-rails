# bienvenue dans simple chat rails


#Gemfile
gem 'actioncable', github: 'rails/actioncable', branche: 'archive'
joyau 'contremaître'
gemme 'puma'
À partir de cet article (~ octobre 2015), Action Cable s'appuie sur la fonction pubsub de redis pour acheminer les messages dans les deux sens via la connexion par câble WebSocket, alors installons redis et démarrons le serveur redis localement. Dans un prochain article, j'aborderai le déploiement et la configuration de redis via ansible.

// en supposant que vous utilisez homebrew
$ brasser installer redis

$ serveur redis
Maintenant que notre serveur redis est en cours d'exécution, configurons Action Cable pour se connecter à notre serveur redis. Par défaut, ActionCable::Server::Base recherchera un fichier de configuration dans config/redis/cable.yml.

# config/redis/cable.yml

locale : &locale
   :url: redis://localhost:6379
   :hôte : hôte local
   :port: 6379
   :délai d'attente : 1
   :inline: vrai

développement : *local

essai : *local
Super, maintenant Action Cable a une configuration à charger pour se connecter à notre serveur redis. Mais nous allons exécuter Action Cable en tant que processus distinct de notre application de rails principaux. Pour ce faire, je vais utiliser Foreman pour gérer à la fois notre processus Web principal et notre processus Action Cable. Alors d'abord, créons un fichier rackup pour notre processus Action Cable.

# câble/config.ru
nécessite ::File.expand_path('../../config/environment', __FILE__)
Rails.application.eager_load !

nécessite 'action_cable/process/logging'

exécuter ActionCable.server
Ensuite, je vais créer mon Procfile pour informer le contremaître de notre processus supplémentaire. Dans un article ultérieur, nous extrairons ces variables codées en dur exportées via foreman et définies dans ansible.

// Profil
web : bundle exec rails s -p 3000 -e développement Puma
action_cable : bundle exec puma -p 28080 cable/config.ru
Enfin, nous devons créer notre classe Connection (pour gérer l'authentification) et Channel (pour héberger la logique partagée entre les canaux). Pour la configuration de base, c'est tout ce dont vous avez besoin :

# app/channels/application_cable/connection.rb

module ApplicationCâble
   classe Connexion < ActionCable::Connection::Base
   fin
fin

# app/channels/application_cable/channel.rb
module ApplicationCâble
   classe Canal < ActionCable::Channel::Base
   fin
fin
D'ACCORD. Donc, si nous avons tout fait correctement, exécuter le démarrage du contremaître démarrera nos 2 processus
Étape 4 : Redémarrez le serveur Redis
Redémarrez le serveur Redis comme suit :

  Redémarrage du serveur redis du service sudo
