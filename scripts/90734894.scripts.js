(function(){"use strict";angular.module("stringtheoryApp",["angularLocalStorage","ui.bootstrap"]).config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).when("/strings",{templateUrl:"views/strings.html",controller:"StringsCtrl"}).otherwise({redirectTo:"/"})}]).directive("json",function(){return{restrict:"A",require:"ngModel",link:function(a,b,c,d){var e,f;return e=function(a){return a&&""!==a.trim()?angular.fromJson(a):{}},f=function(a){return angular.toJson(a,!0)},d.$parsers.push(e),d.$formatters.push(f),a.$watch(c.ngModel,function(a,b){return a!==b?(d.$setViewValue(f(a)),d.$render()):void 0},!0)}}})}).call(this),function(){"use strict";angular.module("stringtheoryApp").controller("MainCtrl",["$scope",function(){}])}.call(this),function(){"use strict";angular.module("stringtheoryApp").controller("StringsCtrl",["$scope","storage",function(a,b){var c,d;return d=[{key:"text",title:"Original Text",required:!0},{key:"reading",title:"Reading/Pronunciation",required:!1},{key:"translation",title:"Translation",required:!1}],c={showSettings:!1,perPage:25},b.bind(a,"strings",{defaultValue:[]}),b.bind(a,"settings",{defaultValue:c}),b.bind(a,"template",{defaultValue:d}),a.stringFields=[],a.filteredStrings=[],a.currentPage=1,a.maxSize=5,a.perPage=a.settings.perPage||25,a.$watch("currentPage + perPage",function(){var b,c;return c=(a.currentPage-1)*a.perPage,b=c+a.perPage,"function"==typeof console.log&&console.log([c,b]),a.filteredStrings=a.strings.slice(c,b)}),a.calculateStringFields=function(){var b,c,d,e,f;for(a.stringFields=[],e=a.template,f=[],c=0,d=e.length;d>c;c++)b=e[c],b=angular.copy(b),b.data="",f.push(a.stringFields.push(b));return f},a.calculateStringFields(),a.$watch("template",function(){return console.log("Template changed"),a.calculateStringFields()}),a.addString=function(){var b,c,d,e,f;for(c={},f=a.stringFields,d=0,e=f.length;e>d;d++)b=f[d],c[b.key]=b.data,b.data="";return a.strings.unshift(c)},a.removeString=function(b){return a.strings.splice(b,1)},a.resetTemplate=function(){return a.template=d},a.resetSettings=function(){return a.settings=c}}])}.call(this);