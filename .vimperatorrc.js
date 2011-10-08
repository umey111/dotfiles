// _vimperatorrc.js
// vimscript用javascript設定ファイル

// autocommands内で関数を作成できるように
let liexe = liberator.execute;
liberator.execute = function (fun, modifiers) {
  if (fun instanceof Function) {
    return fun();
  }
  liexe.apply(liberator, arguments);
};

// Add Mapping `C-c' copy or stop loading
// liberator.modules.mappings.addUserMap([liberator.modes.NORMAL,liberator.modes.VISUAL,liberator.modes.INSERT], ['<C-c>'],
//liberator.modules.mappings.addUserMap([liberator.modules.modes.NORMAL,liberator.modules.modes.VISUAL], ['<C-c>'],
//   'Copy selected text or ',
// function () {
// 	var sel = liberator.modules.buffer.getCurrentWord();
// 	if (sel) {
// 		liberator.modules.util.copyToClipboard(sel, true);
// 		liberator.echo('Yanked: ' + liberator.modules.util.escapeHTML(sel) );
// 	} else {
// 		BrowserStop();
// 		liberator.echo('Stopped loading !');
// 	}
// }
//);

liberator.modules.options.setPref('ui.key.generalAccessKey', 0);
//copy.js setting
liberator.globalVariables.copy_templates = [
  { label: 'URL',    value: '%URL%' },
  { label: 'titleAndURL',    value: '%TITLE%\n%URL%' },
  { label: 'title',          value: '%TITLE%' },
  { label: 'anchor',         value: '<a href="%URL%">%TITLE%</a>' },
  { label: 'selanchor',      value: '<a href="%URL%" title="%TITLE%">%SEL%</a>' },
  { label: 'htmlblockquote', value: '<blockquote cite="%URL%" title="%TITLE%">%HTMLSEL%</blockquote>' },
];

//autoignorekey.js setting
liberator.globalVariables.autoignorekey_pages = uneval([
  /^https?:\/\/www\.google\.com\/notebook\//,
  /^https?:\/\/www\.remeberthemilk\.com\/home\//,
]);
//  /^https?:\/\/mail\.google\.com\//,
//  /^https?:\/\/www\.google\.com\/reader\//,

// Gmail
//autocommands.add('LocationChange',/mail\.google\.com\/(mail|a)\//,[
//  'js plugins.feedKey.setup(',
//  '"c / y j k n p o u e x s r a # [ ] z ? gi gs gt gd ga gc".split(/ +/).map(function(i) [i, "4"+ i])',
//  ');'
//].join(''));
// autocommands.add(
//   'LocationChange',
//   /mail\.google\.com\/(mail|a)\//,
//   function () {
//     plugins.feedKey.setup(
//       "c / y j k n p o u e x s r a # [ ] z ? gi gs gt gd ga gc gl".split(/ +/).map(function(i) [i, "4" + i])
//     )
//   }
// );

//GoogleReader
///autocommands.add('LocationChange',/www\.google\.(com|tld)\/reader\/view\//,[
///'"j / k n p o u e s r v a m N P S X O A <Space> <S-Space> ? 1 2 gu gh gs gS gt gT gd ga".split(/ +/).map(function(i) [i, "0" + i])',
///'js plugins.feedKeyGoogleReader.setup("j / k n p o u e s r v a m N P S X O A <Space> <S-Space> ? 1 2 gu gh gs gS gt gT gd ga".split(/ +/));');
//Spaceが効かない！
// autocommands.add('LocationChange',/www\.google\.(com|tld)\/reader\/view\//,
//   'js plugins.feedKey.setup("j / k n p o u e s r v a m N P S X O A ? 1 2 gu gh gs gS gt gT gd ga".split(/ +/).map(function(i) [i,  "4" + i]), true)');

// autocommands.add(
//   'LocationChange',
//   /www\.google\.(com|tld)\/reader\/view\//,
//   function () {
// 	liberator.plugins.feedKey.setup(
// 	  "j / k n p o u e s r v a m N P S X O A ? 1 2 gu gh gs gS gt gT gd ga".split(/ +/).map(function(i) [i, "4" + i]),
// 	  true
// 	)
//   }
// );

// Google Reader
// autocommands.add(
//   'LocationChange', 
//   /www\.google\.(com|co\.jp)\/reader\/view\//,
//   function () {
//     liberator.plugins.feedKey.setup(
//       [
//        "/", "?", "n", "p", "u", "m", "v", "N", "P", "O", "x", ["o", "O"],
//        ["j", "<SPACE>"], ["k", "<S-SPACE>"], ["<SPACE>", "j"], ["<S-SPACE>", "k"], 
//        "s", "S", "A", "J", "K", "=", "-", "gs", "gS", "gh", "ga", "gu", "gt", "gd"
//       ].map(function(it) ((typeof it == "string") ? [it, "4" + it] : [it[0], "4"+it[1]])),
//       true
//     );
//   }
// );

//  'js if(plugins.gmperator.currentSandbox.LDRize.getSiteinfo()) liberator.plugins.feedKey.setup([["J","j"],["K","k"],"p","v","o","i"]);');
// autocommands.add('GMActiveScript', "\nldrize\\.user\\.js$",
//   'js if(plugins.gmperator.currentSandbox.LDRize != undefined && plugins.gmperator.currentSandbox.LDRize.getSiteinfo()) plugins.feedKey.setup([["J","j"],["K","k"],"p","v","o","i","s"]);');
//autocommands.add(
//  'GMActiveScript',
//  "\nldrize\\.user\\.js$", 
//  function () {
//	if(plugins.gmperator.currentSandbox.LDRize != undefined && plugins.gmperator.currentSandbox.LDRize.getSiteinfo())
//	plugins.feedKey.setup([["J","j"],["K","k"],"p","v","o","i"]);
//  }
//);

//mapを移動
//[
//    // ['z',':back'],
//    // ['x',':forward'],
//    ['V',':viewSBMComments -t hdl'],
//    [',l',':set ldrc'],
//    [',q',':toggleldrc'],
//    [',a',':dialog addbookmark'],
//	[',es',':set fenc=Shift_JIS'],
//	[',ee',':set fenc=EUC-JP'],
//	[',eu',':set fenc=utf-8'],
//    ['S',':tb'],
//    ['!',':set invum'],
//    ['\\d',':sd'],
//	[',ni',':nicoinfo'],
//	[',np',':nicopause'],
//	[',nm',':nicomute'],
//	[',nv',':nicommentvisible'],
//	[',nz',':nicosize'],
//	[',ns',':nicoseek'],
//].forEach(function([key,command]){
//    liberator.modules.mappings.addUserMap([liberator.modules.modes.NORMAL], [key],
//        "User defined mapping",
//        function () { liberator.execute(command); },
//        {
//            rhs: key,
//            noremap: true
//        });
//});

// +でシークすると拡大とか困るのでコメントアウトした
// javascript <<EOM
// // [N]-
// // N 秒前にシークする。
// // 指定なしの場合 10 秒前。
// liberator.modules.mappings.addUserMap(
//     [liberator.modes.NORMAL],
//     ['-'],
//     'seek by count backward',
//     function(count) {
//         if(count === -1) count = 10;
//         liberator.execute(':nicoseek! ' + '-' + count);
//     },
//     { flags: liberator.modules.mappings.flags.COUNT }
// );
// 
// // [N]+
// // N 秒後にシークする。
// // 指定なしの場合 10 秒後。
// liberator.modules.mappings.addUserMap(
//     [liberator.modes.NORMAL],
//     ['+'],
//     'seek by count forward',
//     function(count) {
//         if(count === -1) count = 10;
//         liberator.execute(':nicoseek! ' + count);
//     },
//     { flags: liberator.modules.mappings.flags.COUNT }
// );
// EOM
// 


//プラグイン設定
//Greasemonkey 0.9.xでwindowを共通にする
autocommands.add('VimperatorEnter', '.*', function() {
	let gm = Components.classes['@greasemonkey.mozdev.org/greasemonkey-service;1']; 
	if (gm) { 
		gm = gm.getService().wrappedJSObject; 
		if (gm.injectScripts.toSource().search('sharedWindow') == -1) { 
			gm.injectScripts = liberator.eval( 
				gm.injectScripts.toSource() 
				.replace(/(?=var firebugConsole)/, 
					'var sharedWindow = {};' + 'sharedWindow.window = sharedWindow;' + 'sharedWindow.__proto__ = new XPCNativeWrapper(unsafeContentWin);') 
				.replace(/(?=sandbox\.__proto__)/, ' sandbox.window = sharedWindow;'), gm.injectScripts); } } });

function addLocalMappings(buffer, maps) {
  maps.forEach(
    function (map) {
      let [cmd, action, extra] = map;
      let actionFunc = action;
      extra || (extra = {});

      if (typeof action == "string") {
        if (action.charAt(0) == ':')
          actionFunc = extra.open ? function () commandline.open("", action, modes.EX)
                                  : function () liberator.execute(action);
        else
          actionFunc = function () events.feedkeys(action, extra.noremap, true);
      }
      extra.matchingUrls = buffer;
      mappings.addUserMap(
        [modes.NORMAL],
        [cmd],
        "Local mapping for " + buffer,
        actionFunc,
        extra
      );
    }
  );
}
// stella.jsの設定
addLocalMappings(
  /^(http:\/\/(es|www).nicovideo.jp\/(watch|playlist\/mylist)|http:\/\/(jp|www)\.youtube\.com\/watch|http:\/\/(www\.)?vimeo\.com\/(channels\/(hd)?#)?\d+)/,
  [
    ['<C-g>', ':pageinfo S',      ],
    ['p',     ':stplay',          ],
    ['m',     ':stmute',          ],
    ['c',     ':stcomment',       ],
    ['zz',    ':stlarge',         ],
    ['r',     ':strepeat',        ],
    ['+',     ':stvolume! 10',    ],
    ['-',     ':stvolume! -10',   ],
    ['H',     ':stseek! -10',     ],
    ['L',     ':stseek! 10',      ],
    ['K',     ':stvolume! 10',    ],
    ['J',     ':stvolume! -10',   ],
    ['s',     ':stseek ',         {open: true}],
    ['S',     ':stseek! ',        {open: true}],
    ['v',     ':stvolume ',       {open: true}],
    ['V',     ':stvolume! ',      {open: true}],
    ['o',     ':strelations ',    {open: true}],
    ['O',     ':strelations! ',   {open: true}],
  ]
);

  if (1) { // Kill Menu Mode and shortcut keys on Hint mode {{{
    // imap されていないキーで無視したいものは、inoremap <C-n> <nop> などとしておく
    window.addEventListener(
      'keypress',
      function (event) {
        function killEvent ()
          (event.preventDefault(), event.stopPropagation());

        if (liberator.mode === modes.COMMAND_LINE && modes.extended === modes.HINTS) {
          let key = events.toString(event);
          if (/^<[CA]/.test(key))
            killEvent();
        }

        if (modes.isMenuShown) {
          let key = events.toString(event);
          if (key == '<Space>')
            return;
          let map = mappings.get(modes.INSERT, events.toString(event));
          if (map) {
            killEvent();
            map.execute();
          }
        }
      },
      false
    );
  }

/*
liberator.globalVariables.exopen_templates = [
  {
    label: 'vimpnightly',
    value: 'http://code.google.com/p/vimperator-labs/downloads/list?can=1&q=label:project-vimperator',
    description: 'open vimperator nightly xpi page',
    newtab: true
  }, {
    label: 'vimplab',
    value: 'http://www.vimperator.org/vimperator',
    description: 'open vimperator trac page',
    newtab: true
  }, {
    label: 'vimpscript',
    value: 'http://code.google.com/p/vimperator-labs/issues/list?can=2&q=label%3Aproject-vimperator+label%3Atype-plugin',
    description: 'open vimperator trac script page',
    newtab: true
  }, {
    label: 'coderepos',
    value: 'http://coderepos.org/share/browser/lang/javascript/vimperator-plugins/trunk/',
    description: 'open coderepos vimperator-plugin page',
    newtab: true
  }, {
    label: 'sldr',
    value: 'http://reader.livedoor.com/subscribe/%URL%'
  }, {
    label: 'rosen',
    value: 'http://transit.loco.yahoo.co.jp/search/result?from=&to=',
    custom: 
			function(context, args) {
				from = args.shift();
				to = args.shift();
				if(typeof to == 'undefined' || to===''){
					split = from.split("\u3000");
					from = split[0];
					to = split[1];
				}
				return "http://transit.loco.yahoo.co.jp/search/result?from="+from+"&to="+to;
			},
    description: 'open arguments test ',
    newtab: true,
		escape: true
  }
];
*/
// :rosen FROM駅 to駅でyahoo路線検索
commands.addUserCommand(['rosen'], 'Open rosen URL',
	function(args) {
		from = args.shift();
		to = args.shift();
		if(typeof to == 'undefined' || to===''){
			split = from.split("\u3000");
			from = split[0];
			to = split[1];
		}
	  liberator.open("http://transit.loco.yahoo.co.jp/search/result?from="+from+"&to="+to, liberator.NEW_TAB);
	}
);

// 見ているページをgmailで送信できる状態に
commands.addUserCommand(['gmailthis'], 'send gmail title URL',
	function() {
		m='https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=&su='+buffer.title+'&body='+buffer.URL;
		liberator.open(m,liberator.NEW_TAB);
	}
);
