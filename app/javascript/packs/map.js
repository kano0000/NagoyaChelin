// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.API_KEY
});




// const response = await fetch("/stores.json").then((res) => res.json()).catch(error => console.error(error))
//   if (response.ok) {
//     const items = response.data.items
//     items.forEach((item) => {
//       const marker = new google.maps.Marker({
//         position: new google.maps.LatLng(item.latitude, item.longitude),
//         map,
//         title: item.name,
//       });
//     });
//   }



// // サーバーからJSONデータを非同期で取得
// const response = await fetch("/stores.json")
//   .then((res) => res.json()) // JSONデータに変換
//   .catch(error => console.error(error)); // エラーが発生した場合はコンソールに表示

// // サーバーからの応答が成功した場合
// if (response.ok) {
//   // JSONデータからアイテムの配列を取得
//   const items = response.data.items;

//   // 各アイテムに対してマーカーを作成し、地図上に表示
//   items.forEach((item) => {
//     // Google MapsのLatLngオブジェクトを作成
//     const position = new google.maps.LatLng(item.latitude, item.longitude);

//     // マーカーを作成し、地図上に表示
//     const marker = new google.maps.Marker({
//       position: position, // マーカーの位置
//       map: map, // 地図オブジェクト
//       title: item.name, // マーカーに表示するタイトル
//     });
//   });
// }

  
  
  
}

initMap()