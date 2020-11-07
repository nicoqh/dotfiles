c.auto_save.session = True

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!dd':      'https://thefreedictionary.com/{}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!m':       'https://www.google.com/maps/search/{}',
    '!t':       'https://www.thesaurus.com/browse/{}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

c.editor.command=['kitty', 'vim', '{file}', 'normal']
