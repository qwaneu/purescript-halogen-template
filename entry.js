const main = require("./output/Main").main;
var reloadCount = reloadCount || 0;
removeOldInstances = function() {
  const appElement = document.getElementById('app');
  while(appElement.firstChild) {
    appElement.removeChild(appElement.firstChild);
  };
};

// try reloading
if(module.hot) {
  module.hot.accept(() => {
    reloadCount++;
    console.log("Hot reloaded " + reloadCount.toString() + " times." );
    removeOldInstances();
    main(); // for some reason nothing happens
  });
};

main(); // this gets run the first time
