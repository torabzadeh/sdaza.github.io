{%- extends 'slides_reveal.tpl' -%}

{% block header %}
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

<title>{{resources['metadata']['name']}} slides</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>




<!-- General and theme style sheets -->
<link rel="stylesheet" href="{{resources.reveal.url_prefix}}/css/reveal.css">
<link rel="stylesheet" href="css/custom.css" id="theme">

<!-- If the query includes 'print-pdf', include the PDF print sheet -->
<script>
if( window.location.search.match( /print-pdf/gi ) ) {
        var link = document.createElement( 'link' );
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = '{{resources.reveal.url_prefix}}/css/print/pdf.css';
        document.getElementsByTagName( 'head' )[0].appendChild( link );
}

</script>

<!--[if lt IE 9]>
<script src="{{resources.reveal.url_prefix}}/lib/js/html5shiv.js"></script>
<![endif]-->

<!-- Get Font-awesome from cdn -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
html {
  overflow-y: visible;
}
.reveal {
  font-size: 160%;
}
.reveal pre {
  width: inherit;
  padding: 0.4em;
  margin: 0px;
  font-family: monospace, sans-serif;
  font-size: 80%;
  box-shadow: 0px 0px 0px rgba(0, 0, 0, 0);
}
.reveal pre code {
  padding: 0px;
}
.reveal section img {
  border: 0px solid black;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0);
}
.reveal i {
  font-style: normal;
  font-family: FontAwesome;
  font-size: 2em;
}
.reveal .slides {
  text-align: left;
}
.reveal.fade {
  opacity: 1;
}
.reveal .progress {
  position: static;
}
div.input_area {
  padding: 0.06em;
}
div.code_cell {
  background-color: transparent;
}
div.prompt {
  width: 11ex;
  padding: 0.4em;
  margin: 0px;
  font-family: monospace, sans-serif;
  font-size: 80%;
  text-align: right;
}
div.output_area pre {
  font-family: monospace, sans-serif;
  font-size: 80%;
}
div.output_prompt {
  /* 5px right shift to account for margin in parent container */
  margin: 5px 5px 0 0;
}
.rendered_html p {
  text-align: inherit;
}
</style>

<!-- Add favicon -->
<link rel="shortcut icon" type="image/ico" href="favicon.ico" />

<!-- Additional imports for plugins -->
<link rel="stylesheet" href="plugin/title-footer/title-footer.css">

</head>
{% endblock header%}

{% block body %}

<script>
require(
    {
      // it makes sense to wait a little bit when you are loading
      // reveal from a cdn in a slow connection environment
      waitSeconds: 15
    },
    [
      "reveal.js-3.6.0/lib/js/head.min.js",
      "reveal.js-3.6.0/js/reveal.js"
    ],

    function(head, Reveal){

        // Full list of configuration options available here: https://github.com/hakimel/reveal.js#configuration
        Reveal.initialize({
            controls: true,
            progress: true,
            history: true,
            math: {  // mathjax: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js',
            config: 'TeX-AMS_HTML-full'},
            transition: "slide",
            // Optional libraries used to extend on reveal.js
            dependencies: [
                { src: "reveal.js-3.6.0/lib/js/classList.js",
                  condition: function() { return !document.body.classList; } },
                { src: "{{resources.reveal.url_prefix}}/plugin/math/math.js",
                async: true,
                condition: function() { return !!document.body.classList; } },
                { src: "reveal.js-3.6.0/plugin/notes/notes.js",
                  async: true,
                  condition: function() { return !!document.body.classList; } }
            ]
        });

        // var update = function(event){
        //   if(MathJax.Hub.getAllJax(Reveal.getCurrentSlide())){
        //     MathJax.Hub.Rerender(Reveal.getCurrentSlide());
        //   }
        // };

        Reveal.addEventListener('slidechanged', update);

        function setScrollingSlide() {
            var scroll = false
            if (scroll === true) {
              var h = $('.reveal').height() * 0.95;
              $('section.present').find('section')
                .filter(function() {
                  return $(this).height() > h;
                })
                .css('height', 'calc(95vh)')
                .css('overflow-y', 'scroll')
                .css('margin-top', '20px');
            }
        }

        // check and set the scrolling slide every time the slide change
        Reveal.addEventListener('slidechanged', setScrollingSlide);

    }

);
</script>

{{ super() }}

{% endblock body %}
