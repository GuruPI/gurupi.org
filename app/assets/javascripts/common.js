var Common = {

  StartApp: function() {
    try {
      window.onscroll = scroll;
      this.InterfaceActions();
    } catch (e) {
      console.log('Error: ' + e);
    }
  },

  InterfaceActions: function() {
    scroll();
  },

};

var scroll = function() {
  window.onscroll = scroll;
  var b = document.getElementsByTagName("body")[0];
  if (window.pageYOffset >= 400) {
    b.className = "scrolled";
  } else {
    b.className = "";
  }   
}

Common.StartApp();