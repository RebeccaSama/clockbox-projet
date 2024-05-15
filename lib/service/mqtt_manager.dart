

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager {
  late MqttServerClient client;

  Future<void> connect() async {
    client = MqttServerClient.withPort( 'broker.emqx.io' , 'flutter_client' , 1883 ); // Mettez votre serveur MQTT ici
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    // client.onUnsubscribed = onUnsubscribed ;
    // client.onSubscribeTopic = onSubscribeTopic;
    // client.onUnsubscribeTopic = onUnsubscribeTopic;
    client.onAutoReconnect = onAutoReconnect;
    client.pongCallback = pong;

    try {
      await client.connect();
      print('Connecté au serveur MQTT');
    } catch (e) {
      print('Exception lors de la connexion au serveur: $e');
    }
  }

  void onConnected() {
    print('Connecté au serveur MQTT');
  }

  void onDisconnected() {
    print('Déconnecté du serveur MQTT');
  }

  void onSubscribed(String topic) {
    print('Abonné à $topic');
  }

  void onSubscribeFail(String topic) {
    print('Échec de l\'abonnement à $topic');
  }

  void onUnsubscribed(String topic) {
    print('Désabonné de $topic');
  }

  void onSubscribeTopic(String topic) {
    print('Souscription à $topic');
  }

  void onUnsubscribeTopic(String topic) {
    print('Désabonnement de $topic');
  }

  void onAutoReconnect() {
    print('Reconnexion automatique');
  }

  void pong() {
    print('Pong');
  }

  // Méthode pour publier un message
  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  // Méthode pour s'abonner à un sujet
  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  // Méthode pour se désabonner d'un sujet
  void unsubscribe(String topic) {
    client.unsubscribe(topic);
  }

  // Méthode pour se déconnecter du serveur MQTT
  void disconnect() {
    client.disconnect();
  }
}
