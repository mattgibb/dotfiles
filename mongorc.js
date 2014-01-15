function difference(objectA, objectB) {
   var propertyChanges = [];
   var objectGraphPath = ["this"];
   (function(a, b) {
      if(a.constructor == Array) {
         // BIG assumptions here: That both arrays are same length, that
         // the members of those arrays are _essentially_ the same, and 
         // that those array members are in the same order...
         for(var i = 0; i < a.length; i++) {
            objectGraphPath.push("[" + i.toString() + "]");
            arguments.callee(a[i], b[i]);
            objectGraphPath.pop();
         }
      } else if(a.constructor == Object || (a.constructor != Number && 
                a.constructor != String && a.constructor != Date && 
                a.constructor != RegExp && a.constructor != Function &&
                a.constructor != Boolean)) {
         // we can safely assume that the objects have the 
         // same property lists, else why compare them?
         for(var property in a) {
            objectGraphPath.push(("." + property));
            if(a[property].constructor != Function) {
               arguments.callee(a[property], b[property]);
            }
            objectGraphPath.pop();
         }
      } else if(a.constructor != Function) { // filter out functions
         if(a != b) {
            propertyChanges.push({ "Property": objectGraphPath.join(""), "ObjectA": a, "ObjectB": b });
         }
      }
   })(objectA, objectB);
   return propertyChanges;
}
