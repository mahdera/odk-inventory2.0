var isCompatible=function(){if(navigator.appVersion.indexOf('MSIE')!==-1&&parseFloat(navigator.appVersion.split('MSIE')[1])<6){return false;}return true;};var startUp=function(){mediaWiki.loader.register([["site","1353656088",[],"site"],["startup","1353661132",[],"startup"],["user","1353656088",[],"user"],["user.options","1353656088",[],"private"],["skins.vector","1353656088",[]],["skins.monobook","1353656088",[]],["skins.simple","1353656088",[]],["skins.chick","1353656088",[]],["skins.modern","1353656088",[]],["skins.cologneblue","1353656088",[]],["skins.nostalgia","1353656088",[]],["skins.standard","1353656088",[]],["jquery","1353656088",[]],["jquery.async","1353656088",[]],["jquery.autoEllipsis","1353656088",["jquery.highlightText"]],["jquery.checkboxShiftClick","1353656088",[]],["jquery.client","1353656088",[]],["jquery.collapsibleTabs","1353656088",[]],["jquery.color","1353656088",[]],["jquery.cookie","1353656088",[]],["jquery.delayedBind","1353656088",[]],[
"jquery.expandableField","1353656088",[]],["jquery.highlightText","1353656088",[]],["jquery.placeholder","1353656088",[]],["jquery.localize","1353656088",[]],["jquery.suggestions","1353656088",["jquery.autoEllipsis"]],["jquery.tabIndex","1353656088",[]],["jquery.textSelection","1353656088",[]],["jquery.tipsy","1353656088",[]],["jquery.ui.core","1353656088",["jquery"]],["jquery.ui.widget","1353656088",[]],["jquery.ui.mouse","1353656088",["jquery.ui.widget"]],["jquery.ui.position","1353656088",[]],["jquery.ui.draggable","1353656088",["jquery.ui.core","jquery.ui.mouse","jquery.ui.widget"]],["jquery.ui.droppable","1353656088",["jquery.ui.core","jquery.ui.mouse","jquery.ui.widget","jquery.ui.draggable"]],["jquery.ui.resizable","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"]],["jquery.ui.selectable","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"]],["jquery.ui.sortable","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"]],[
"jquery.ui.accordion","1353656088",["jquery.ui.core","jquery.ui.widget"]],["jquery.ui.autocomplete","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.position"]],["jquery.ui.button","1353656088",["jquery.ui.core","jquery.ui.widget"]],["jquery.ui.datepicker","1353656088",["jquery.ui.core"]],["jquery.ui.dialog","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.button","jquery.ui.draggable","jquery.ui.mouse","jquery.ui.position","jquery.ui.resizable"]],["jquery.ui.progressbar","1353656088",["jquery.ui.core","jquery.ui.widget"]],["jquery.ui.slider","1353656088",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"]],["jquery.ui.tabs","1353656088",["jquery.ui.core","jquery.ui.widget"]],["jquery.effects.core","1353656088",["jquery"]],["jquery.effects.blind","1353656088",["jquery.effects.core"]],["jquery.effects.bounce","1353656088",["jquery.effects.core"]],["jquery.effects.clip","1353656088",["jquery.effects.core"]],["jquery.effects.drop","1353656088",[
"jquery.effects.core"]],["jquery.effects.explode","1353656088",["jquery.effects.core"]],["jquery.effects.fold","1353656088",["jquery.effects.core"]],["jquery.effects.highlight","1353656088",["jquery.effects.core"]],["jquery.effects.pulsate","1353656088",["jquery.effects.core"]],["jquery.effects.scale","1353656088",["jquery.effects.core"]],["jquery.effects.shake","1353656088",["jquery.effects.core"]],["jquery.effects.slide","1353656088",["jquery.effects.core"]],["jquery.effects.transfer","1353656088",["jquery.effects.core"]],["mediawiki","1353656088",[]],["mediawiki.util","1353656088",["jquery.checkboxShiftClick","jquery.client","jquery.placeholder"]],["mediawiki.action.history","1353656088",["mediawiki.legacy.history"]],["mediawiki.action.edit","1353656088",[]],["mediawiki.action.view.rightClickEdit","1353656088",[]],["mediawiki.special.preferences","1353656859",[]],["mediawiki.special.search","1353656088",[]],["mediawiki.language","1353656088",[]],["mediawiki.legacy.ajax","1353656100"
,["mediawiki.legacy.wikibits"]],["mediawiki.legacy.ajaxwatch","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.block","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.commonPrint","1353656088",[]],["mediawiki.legacy.config","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.diff","1353656088",["mediawiki.legacy.wikibits"],"mediawiki.action.history"],["mediawiki.legacy.edit","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.enhancedchanges","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.history","1353656088",["mediawiki.legacy.wikibits"],"mediawiki.action.history"],["mediawiki.legacy.htmlform","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.IEFixes","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.metadata","1353661132",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.mwsuggest","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.prefs","1353656088",["mediawiki.legacy.wikibits",
"mediawiki.legacy.htmlform"]],["mediawiki.legacy.preview","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.protect","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.search","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.shared","1353656088",[]],["mediawiki.legacy.oldshared","1353656088",[]],["mediawiki.legacy.upload","1353656088",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.wikibits","1353656100",["mediawiki.language"]],["mediawiki.legacy.wikiprintable","1353656088",[]]]);mediaWiki.config.set({"wgLoadScript":"/23/en/load.php","debug":false,"skin":"moodledocsnew","stylepath":"/23/en/skins","wgUrlProtocols":"http\\:\\/\\/|https\\:\\/\\/|ftp\\:\\/\\/|irc\\:\\/\\/|gopher\\:\\/\\/|telnet\\:\\/\\/|nntp\\:\\/\\/|worldwind\\:\\/\\/|mailto\\:|news\\:|svn\\:\\/\\/|git\\:\\/\\/|mms\\:\\/\\/","wgArticlePath":"/23/en/$1","wgScriptPath":"/23/en","wgScriptExtension":".php","wgScript":"/23/en/index.php","wgVariantArticlePath":false,"wgActionPaths":[],
"wgServer":"http://docs.moodle.org","wgUserLanguage":"en","wgContentLanguage":"en","wgVersion":"1.17.2","wgEnableAPI":true,"wgEnableWriteAPI":true,"wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgMainPageTitle":"Main page","wgFormattedNamespaces":{"-2":"Media","-1":"Special","0":"","1":"Talk","2":"User","3":"User talk","4":"MoodleDocs","5":"MoodleDocs talk","6":"File","7":"File talk","8":"MediaWiki","9":"MediaWiki talk","10":"Template","11":"Template talk","12":"Help","13":"Help talk","14":"Category","15":"Category talk","100":"Development","101":"Development talk","102":"Obsolete"},"wgNamespaceIds":{"media":-2,"special":-1,"":0,"talk":1,"user":2,"user_talk":3,"moodledocs":4,"moodledocs_talk":5,"file":6,"file_talk":7,"mediawiki":8,"mediawiki_talk":9,"template":10,"template_talk":11,"help":12,"help_talk":13,"category":14,"category_talk":15,"development":100,"development_talk":101,"obsolete":102,"image":6,"image_talk":7},"wgSiteName":"MoodleDocs","wgFileExtensions":
["png","gif","jpg","jpeg","dia","ai","pdf"],"wgDBname":"23docs_en","wgExtensionAssetsPath":"/23/en/extensions","wgResourceLoaderMaxQueryLength":-1});};if(isCompatible()){document.write("\x3cscript src=\"/23/en/load.php?debug=false\x26amp;lang=en\x26amp;modules=jquery%7Cmediawiki\x26amp;only=scripts\x26amp;skin=moodledocsnew\x26amp;version=20120302T032000Z\"\x3e\x3c/script\x3e");}delete isCompatible;;