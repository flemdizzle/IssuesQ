!function(t){t(function(){if(navigator.userAgent.match(/IEMobile\/10\.0/)){var o=document.createElement("style");o.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}")),document.getElementsByTagName("head")[0].appendChild(o)}var e=t(window),n=t(document.body),i=t(".navbar").outerHeight(!0)+10;n.scrollspy({target:".bs-sidebar",offset:i}),e.on("load",function(){n.scrollspy("refresh")}),t(".bs-docs-container [href=#]").click(function(t){t.preventDefault()}),setTimeout(function(){var o=t(".bs-sidebar");o.affix({offset:{top:function(){var e=o.offset().top,n=parseInt(o.children(0).css("margin-top"),10),i=t(".bs-docs-nav").height();return this.top=e-i-n},bottom:function(){return this.bottom=t(".bs-footer").outerHeight(!0)}}})},100),setTimeout(function(){t(".bs-top").affix()},100),t(".tooltip-demo").tooltip({selector:"[data-toggle=tooltip]",container:"body"}),t(".tooltip-test").tooltip(),t(".popover-test").popover(),t(".bs-docs-navbar").tooltip({selector:"a[data-toggle=tooltip]",container:".bs-docs-navbar .nav"}),t("[data-toggle=popover]").popover(),t("#fat-btn").click(function(){var o=t(this);o.button("loading"),setTimeout(function(){o.button("reset")},3e3)})})}(window.jQuery);