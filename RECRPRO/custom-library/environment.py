def getBaseURL(env='sit'):
    if env == 'sit':
        url = 'https://secretproject1.com'
    elif env == 'prod':
        url = 'https://ravenrecruit.com'
    return url
