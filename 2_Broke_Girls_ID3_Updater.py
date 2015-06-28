#!/usr/bin/python2.7
# Script to automatically rename episodes of 2 Broke Girls
#   The album needs to be updated each season
#   The artwork can also be updated each season
# Use: Drag the file

import os, sys, string, re
import eyed3

def getEpisode(filename):
    try:
        episode = re.search('x(.+?)\ ', filename).group(1)
    except AttributeError:
        episode = 'not found' # apply your error handling
    return episode

def getTitle(filename):
    t = filename.split('-')        # do this the simple way since I know the naming is correct
    s = t[2].rstrip('.mp3')        # take off the extension
    try:
        s = re.search(' (.+)', s).group(1)
    except AttributeError:
        pass
    return s

    
def update_id3(mp3_file_name, artwork_file_name, artist, album, genre, item_title, trackno):    
    audiofile = eyed3.load(mp3_file_name)

    if audiofile.tag is None:                           # needed if frame does not exist
        audiofile.tag = eyed3.id3.Tag()
        audiofile.tag.file_info = eyed3.id3.FileInfo(mp3_file_name)

    imagedata = open(artwork_file_name,'rb').read()
    audiofile.tag.images.set(3,imagedata,"image/jpeg",u"")  # a description can go in the last part
    audiofile.tag.artist = artist                       # artist
    audiofile.tag.album = album                         # album title
    audiofile.tag.title = item_title.decode('utf-8')    # unicode
    audiofile.tag.track_num = (trackno,"")              # tuple of (track, total tracks)
    audiofile.tag.genre = genre                         # genre
    audiofile.tag.save()

def main():
    mp3_file_name = sys.argv[1]
    artist = u"2 Broke Girls"
    album = u"2 Broke Girls - Season 04"
    genre = u"TV"
    artwork_file_name = "/home/misc/scripts/supporting/2BrokeGirls/Season04.png"
    tracknumber = getEpisode(mp3_file_name)
    item_title = getTitle(mp3_file_name)

    update_id3(mp3_file_name, artwork_file_name, artist, album, genre, item_title, tracknumber)    


if __name__ == '__main__':
    main()

