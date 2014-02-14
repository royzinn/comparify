(($) ->
  $.fn.jTruncate = (h) ->
    i =
      length: 300
      minTrail: 20
      moreText: "more"
      lessText: "less"
      ellipsisText: "..."
      moreAni: ""
      lessAni: ""

    h = $.extend(i, h)
    @each ->
      obj = $(this)
      a = obj.html()
      if a.length > h.length + h.minTrail
        b = a.indexOf(" ", h.length)
        unless b is -1
          b = a.indexOf(" ", h.length)
          c = a.substring(0, b)
          d = a.substring(b, a.length - 1)
          obj.html c + "<span class=\"truncate_ellipsis\">" + h.ellipsisText + "</span>" + "<span class=\"truncate_more\">" + d + "</span>"
          obj.find(".truncate_more").css "display", "none"
          obj.find(".truncate_more").after "<div class=\"clearboth\">" + "<a href=\"#\" class=\"truncate_more_link\">" + h.moreText + "</a>" + "</div>"
          e = $(".truncate_more_link", obj)
          f = $(".truncate_more", obj)
          g = $(".truncate_ellipsis", obj)
          e.click ->
            if e.text() is h.moreText
              f.show h.moreAni
              e.text h.lessText
              g.css "display", "none"
            else
              f.hide h.lessAni
              e.text h.moreText
              g.css "display", "inline"
            false

      return
  return
) jQuery
