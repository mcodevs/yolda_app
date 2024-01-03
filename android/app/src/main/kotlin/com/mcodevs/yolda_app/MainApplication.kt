package com.mcodevs.yolda_app

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    MapKitFactory.setApiKey("784d514d-d501-4a85-b33e-019fa7f1682c") // Your generated API key
  }
}