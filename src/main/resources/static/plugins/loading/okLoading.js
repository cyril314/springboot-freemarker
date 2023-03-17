var ok_load_options = {
	time: 1000,
	content: "loading..."
};
!function (content, options) {
	function templateFun(vals) {
		return "<div class='ok-loading'>\n" +
            "\t    <div class='loader'>\n" +
            "\t      <div class='text'>"+vals.content+"</div>\n" +
            "\t      <div class='horizontal'>\n" +
            "\t        <div class='circlesup'>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t        </div>\n" +
            "\t        <div class='circlesdwn'>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t\t<div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t        </div>\n" +
            "\t      </div>\n" +
            "\t      <div class='vertical'>\n" +
            "\t        <div class='circlesup'>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t        </div>\n" +
            "\t        <div class='circlesdwn'>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t          <div class='circle'></div>\n" +
            "\t        </div>\n" +
            "\t      </div>\n" +
            "\t    </div>\n" +
            "\t  </div>"
	}

	function headerInit(content, options) {
		options = options || {};
		if (typeof content == "string") {
			options["content"] = content || ok_load_options.content;
		} else if (typeof content == "object") {
			options = content;
		}
		options.time = options.time || ok_load_options.time;
		options.content = options.content || ok_load_options.content;
		return options;
	}

	ok_load_options = headerInit(content, options);
	var template = templateFun(ok_load_options);
	document.writeln(template);
}();

var okLoading = {
	close: function ($, time, dom) {
		time = time || ok_load_options.time;
		dom = dom || document.getElementsByClassName("ok-loading")[0];
		if ($) {
			$(dom).delay(time).animate({
				opacity: 0
			}, 1000, "linear", function () {
				$(dom).remove();
			});
		} else {
			var setTime1 = setTimeout(function () {
				clearTimeout(setTime1);
				dom.classList.add("close");
				var setTime2 = setTimeout(function () {
					clearTimeout(setTime2);
					dom.parentNode.removeChild(dom);/**删除当前节点*/
				}, 800);
			}, time);
		}
	}
};


