#!/usr/bin/python

# Script to generate Activities and Events pages for BigWeekendCalendars.com.
# The text in the output file needs to be copied manually to the sites.
# Before using this you must save the data from the source workbooks into tab-delimited files.
# Updated: 20141021 - Made options available as arguments; added case conversion for data and types
# Updated: 20151025 - Updated ad copy and removed some useless bits.

# Yearly actions
# 1) Get access to updated listed of activities and events.
# 2) Create alphabetized, tab-delimited, source files for each site.
# 3) Determine if ads_on should be on/off.
# 4) Update ad copy. 
# 5) Verify required output format. 

import csv, sys, os

def main():
    if len(sys.argv) < 3: usage()

    site_type = sys.argv[1].upper()
    input_file = sys.argv[2]

    if not (os.path.isfile(input_file)):
        print(input_file + " does not exist")
        quit()

    title_col = 0      # Column for event title.
    desc_col  = 1      # Column for event description.
    url_col   = 2      # Column for event URL.
    ads_on    = True   # Insert ads (boolean).
    ad_freq   = 7      # How often to insert ads.

    # Set the header. Some years this is not needed.
    header = r'<div class="yui3-widget sqs-widget yui3-block-base yui3-block-parent-base sqs-block-html sqs-block html-block sqs-selected">' + "\n"

    # Set site-specific ads_on. Update this yearly.
    austin_ad_text   = r'<strong>Get all these events on the <a href="http://www.amazon.com/gp/product/0990544311/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0990544311&linkCode=as2&tag=austinfunstuf-20&linkId=SEL566I2FUBNXBSQ"> Austin Events 2016 Wall Calendar</br><img src="AUSTIN2016IMAGE" alt="Big Weekend Calendars" width="250" height="250" /></a></strong>'
    portland_ad_text = r'<strong>Get all these events on the <a href="http://www.amazon.com/gp/product/099054432X/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=099054432X&linkCode=as2&tag=austinfunstuf-20&linkId=3YDPIIJ64MKBESPJ"> Portland Events 2016 Wall Calendar</br><img src="PORTLAND2016IMAGE" alt="Big Weekend Calendars" width="250" height="250" /></a></strong>'

    # Set the output file.
    outfile = input_file + ".output"
    f = open(outfile,'w')

    f.write(header)

    with open(input_file) as tsv:
        counter = 0
        for line in csv.reader(tsv, delimiter = "\t"):  # Tab-delimited file.
            titl = line[title_col].strip()     # Event title.
            desc = line[desc_col].strip()      # Event description.
            surl = line[url_col].strip()       # Shortened URL.
            url  = r'http://' + line[url_col]  # The fully qualified URL.
            good_desc = True                   # Assume row has a description.
            good_url  = True                   # Assume row has a URL defined.
            # Choose the correct ad.
            ad_text = austin_ad_text if site_type == 'A' else portland_ad_text

            # Wrap the title in HTML.
            titlerow = r'<p><strong>' + titl + r'</strong><br>'

            # Filter out bad descriptions and URLs.
            if desc.lower() in ("", "no copy"): good_desc = False
            if surl == "": good_url = False

            # Write the entry to the output file if the URL and Description are good.
            if (good_url and good_desc):
                counter += 1;
                f.write(titlerow)
                f.write(desc + '<br>')

                # Handle events with mutliple URLs.
                if "," in surl:
                    urls = surl.split(",")
                    for ur in urls:
                        ur = ur.strip()
                        url  = r'http://' + ur
                        # Wrap the URL in html (using shortened form for visibile text).
                        urlrow   = r'<a href="' + url + r'">' + ur + r'</a><br>'
                        f.write(urlrow)
                    f.write(r'</p>' + '\n')
                else:
                    # Wrap the URL in html (using shortened form for visibile text).
                    urlrow   = r'<a href="' + url + r'">' + surl + r'</a></p>'
                    f.write(urlrow + '\n')

                # Insert ads_on as needed.
                if (counter % ad_freq == 0) and ads_on:
                    f.write(ad_text + '\n')
    f.close()

def usage():
    print("generate_activities_events.py (A)ustin\(P)ortland infile.tsv")
    quit()

if __name__ == '__main__':
    main()