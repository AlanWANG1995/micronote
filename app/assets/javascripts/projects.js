function autoResize(obj){
  var height = obj.contentWindow.document.body.scrollHeight;
  console.log("current height ::" + height);
  obj.style.height = (height > 768)? height+'px':'768px';
}
