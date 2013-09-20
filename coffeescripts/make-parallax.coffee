( ( $ ) ->
	$.fn.makeParallax = (options) ->
		$_this = $(this)

		console.log 'test'

		settings = $.extend(
			offset : 0
			distance : 0
		, options)

		isNegative = false
		if settings.distance < 0
			isNegative = true
		
		
		$(window).scroll ->		
			if !isNegative
				scrollDistance = $_this.parent().offset().top - settings.offset
			else
				scrollDistance = settings.scrollDistance

			calcRatio = scrollDistance / settings.distance
			perPixel = 1 / calcRatio
			
			if !isNegative
				newTop = settings.distance - ( $(window).scrollTop() * perPixel )
			else
				newTop = $(window).scrollTop() * perPixel
			
			if newTop > 0 && !isNegative
				$_this.css('top', newTop)
			else if newTop < 0 && isNegative
				$_this.css('top', newTop)
			else
				$_this.removeAttr('style')

) jQuery