'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "6bb102bf084ab0540fd3fc42764dbb6a",
"/": "6bb102bf084ab0540fd3fc42764dbb6a",
"assets/NOTICES": "347911ae2bc443dbe4884d97b10c2400",
"assets/assets/home.svg": "7722efb0e4e035970bd6a6928452bc1f",
"assets/assets/clima_2.svg": "4cdf8bbd9757d2dbb876308d41f200f5",
"assets/assets/recommendations.json": "67ff6d78693db04203e7a8e904bb762a",
"assets/assets/plus.png": "5d52f608ca03f095243e86290c68783a",
"assets/assets/replace.png": "f3b5d27ca360b768aaecfb8dd76690e0",
"assets/assets/search.svg": "7fd9c56b7d7fa8feee8c33d5aa90ed7a",
"assets/assets/clima_3.svg": "2af06d74011c01aa56961899d4e9caf8",
"assets/assets/cart.json": "cec13d4981d951ff339603018dfb60bb",
"assets/assets/history.svg": "40e4cf343011ee4edab0e9fbdede5329",
"assets/assets/clima_1.svg": "7d453602b505b2a7ee37ff268e92a644",
"assets/assets/water_icon.png": "04eb70e4f1925a91dd0ee999876e7c9d",
"assets/assets/customer.json": "a03aaf1c7665a3d9c0d2a6cdeff9c772",
"assets/assets/placeholder.png": "1632e46a5c79d43f3125ca62c54189cb",
"assets/assets/onboarding1.png": "535d3bf6d95bee188813d3f687b53d0a",
"assets/assets/animal_icon.png": "bc0429fb5a7017760e8eb1b4ada58806",
"assets/assets/animal_5.svg": "97a038652c19330645a556634f8a2e0e",
"assets/assets/badge1.png": "40fe9a6b573bf1ca2d2157f600833722",
"assets/assets/animal_4.svg": "e16f6f01f66343169e709dab7bc62c1f",
"assets/assets/animal_3.svg": "60de8527df32f251cbd6988c41d2dd2f",
"assets/assets/onboarding3.png": "1473755c2b53a465ffbc33235d2f130f",
"assets/assets/co2_icon.png": "ef9b083425e799b5a6ee7f283c987f97",
"assets/assets/profile.svg": "840aae28ffcfaf7720530890e953138a",
"assets/assets/onboarding2.png": "44ec28941b37c7e2d9e18e1c0f235769",
"assets/assets/game.svg": "eebe9aced4e9fea824b679298b2fa32d",
"assets/assets/road.svg": "ae01927538d2c3d4c235d64ff7c70ecf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "8893bba47e827b818ad344ae36ad8eb4",
"version.json": "1fc62e3db405e39ea2f7a7bbe6e4d3d7",
"manifest.json": "a680a64650bf32494c9c10c1dd629941",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js": "bcfb988d72d181f70e5a4c0331b3a6ff"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
