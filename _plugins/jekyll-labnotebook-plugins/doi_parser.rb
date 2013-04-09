# Title: doi_parser.rb
# Author: Carl Boettiger, @cboettig
# License: MIT
# Description: A custom liquid filter that takes a DOI and returns HTML with a link to the DOI, and a link to a pdf in /assets/files/pub/doivalue.pdf, and adds the Google Analytics javascript to track both links.  Also includes semantic definition of the DOI using the datacite ontology.  
#
# Further development: Query CrossRef using the DOI and return the full citation information.  See: https://github.com/ottbot/crossref and https://github.com/CrossRef

module TextFilter
  def doi_parser(input)
    string = '<a rel="datacite:doi"
    href="http://dx.doi.org/' + input + '"
    onclick="recordOutboundLink(this, \"DOI\", \"' + input + '\"); 
    return false;"
    >doi</a>:' + input + ' (<a 
    href="/assets/files/pubs/' + input + '.pdf"
    onclick="var that=this;
    _gaq.push([\"_trackEvent\",\"Publication\",\"' + input + '\",this.href]); 
    setTimeout(function(){location.href=that.href;},200);
    return false;">pdf</a>)'
    string
  end
end
Liquid::Template.register_filter(TextFilter)
