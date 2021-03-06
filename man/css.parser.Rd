\name{css.parser}
\Rdversion{1.1}
\alias{css.parser}
\title{
	Minimal CSS parser
}
\description{
	Minimal CSS (Cascading Style Sheets) parser. 
}
\usage{
css.parser(file, lines = readLines(file))
}
\arguments{
  \item{file}{
file to parse
}
  \item{lines}{
lines of text to parse, read from \samp{file} by default
}
}
\value{
	A list with one element per style class declaration. Each element 
	is a list which has one element per CSS setting (\samp{color}, \samp{background}, ...)
}
\references{
	\url{http://www.w3schools.com/css/}
	\url{http://www.w3schools.com/css/css_colors.asp}
}
\author{
Romain Francois <romain@r-enthusiasts.com>
}
\note{
	The parser is very minimal and will only identify CSS declarations like
	the following : 
	
\preformatted{
.classname{
	setting1 : value ;
	setting2 : value ;
} }

	The line where a declaration occurs must start with a dot, 
	followed by the name of the class and a left brace. The declaration
	ends with the first line that starts with a right brace. The function
	will warn about class names containing numbers as this is likely to 
	cause trouble when the parsed style is translated into another 
	language (e.g. latex commands).
	
	Within the css declaration, the parser identifies setting/value 
	pairs separated by \samp{:} on a single line. Each setting must 
	be on a seperate line.
	
	If the setting is \samp{color} or \samp{background}, the parser then
	tries to map the value to a hex color specification 
	by trying the following options: the value is already a hex
	color, the name of the color is one of the 16 w3c standard colors
	(see \url{http://www.w3schools.com/css/css_colors.asp}), the name 
	is an R color (see \code{\link[grDevices]{colors}}), the 
	color is specified as \samp{rgb(r,g,b)}. If all fails, the
	color used is black for the \samp{color} setting and 
	\samp{white} for the \samp{background} setting.

	Other settings are not further parsed at present.
	
}
\examples{
\dontrun{
cssfile <- system.file( "stylesheet", "default.css", package="highlight")
css.parser( cssfile )
}
}
\keyword{ manip }

