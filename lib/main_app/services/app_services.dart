import 'dart:developer';
import 'package:just_audio/just_audio.dart';
import 'package:stogo_play/main_app/constants/asset_resources.dart';

class AppServices {
  static final AudioPlayer bgPlayer = AudioPlayer();
  static final AudioPlayer sfxPlayer = AudioPlayer();

  static Future<void> playBackgroundMusic() async {
    try {
      log("🎵 Trying to play background music");
      await bgPlayer.setLoopMode(LoopMode.one); 

      // Load and play asset
      await bgPlayer.setAsset(AssetResources.gameBgMusic);
      await bgPlayer.play();
      log("✅ Background music started");
    } catch (e) {
      log("🎵 Error playing background music: $e");
    }
  }

  static Future<void> stopBackgroundMusic() async {
    try {
      await bgPlayer.stop();
    } catch (e) {
      log("🛑 Error stopping background music: $e");
    }
  }

  static Future<void> playSoundEffect() async {
    try {
      // Load and play asset
      await sfxPlayer.setAsset(AssetResources.tapSound);
      await sfxPlayer.play();
    } catch (e) {
      log("🔔 Error playing sound effect: $e");
    }
  }
}
