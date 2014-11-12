#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team
#' @param date
#' @return \code{TRUE} if \code{team.name} has an NHL game on \code{date},
#' \code{FALSE} otherwise
#' @keywords misc
#' @note case in \code{team.name} is ignored
#' @importFrom RCurl getURL
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")

gday <- function(team="canucks", date = Sys.Date()) {
	stopifnot(as.Date(date))
	url <- paste0("http://live.nhle.com/GameData/GCScoreboard/", date, ".jsonp")
	grepl(team, getURL(url), ignore.case=TRUE)
}

