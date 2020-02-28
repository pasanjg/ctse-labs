'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "787d1a08824ca61dfca477ea2fc83ca9",
"/assets\assets\fonts\AvenirNextLTPro-Bold.otf": "91d8ff8ac25f51073a577408ae9cec86",
"/assets\assets\fonts\AvenirNextLTPro-Demi.otf": "553decd415b14f0f0662a4694c624846",
"/assets\assets\fonts\AvenirNextLTPro-Regular.otf": "b5ed933057eaf1919dd79d81248cdbce",
"/assets\assets\images\avatars\user_1.png": "5a3b584eedef5884e2078768d52a69f1",
"/assets\assets\images\avatars\user_2.png": "3125eb9cadd9711d863c7819120aeaa1",
"/assets\assets\images\avatars\user_3.png": "ae7d72348fd1c3a5b5478a07ecde37d0",
"/assets\assets\images\avatars\user_4.png": "9fa540e148c4b1a6bb534d01ebe1b7a8",
"/assets\assets\images\avatars\user_5.png": "e6283de7d7a6aa3b70065f18986dea64",
"/assets\assets\images\avatars\user_6.png": "f9c264e800e192105d30a96ea19558ae",
"/assets\assets\images\avatars\user_7.png": "bc6bfdeed86e3c2d9d59f4199cc3b97e",
"/assets\assets\images\avatars\user_8.png": "dc5f90ffe0c9b04e35b42e000a62b946",
"/assets\assets\images\fb_logo.png": "2240afe4974c51da42d9247c3e43b3fc",
"/assets\assets\images\google_logo.png": "7e1d5aa3345f698c5c0458a244ea544f",
"/assets\assets\images\login_image.jpg": "2b38a9380b1ea5bdf8800ed8b95e8cd5",
"/assets\assets\images\main_image.jpeg": "3cb0eef03ffd476cd62bb00c09f82b30",
"/assets\assets\images\shop_logo.png": "59bb8df2563c4d48a5f37a70c2e7da95",
"/assets\FontManifest.json": "b2004cfc9c5076e4ef260a3412be7a84",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\LICENSE": "1a80be6c5724a31e6f9c9e06dba53b63",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/icons\Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons\Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "797e3a346e133d48b8d6be1c33aac5f3",
"/main.dart.js": "99bc38158a0212634ce934a9c6fddc07",
"/manifest.json": "720f79e3b750854b75a65f7158998e22"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
