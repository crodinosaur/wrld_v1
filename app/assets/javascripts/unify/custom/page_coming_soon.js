var PageComingSoon = function () {
    return {
      //Coming Soon
      initPageComingSoon: function () {
			var newYear = new Date();
			newYear = new Date("November 11, 2016 11:13:00");
			$('#defaultCountdown').countdown({until: newYear})
        }
    };
}();
