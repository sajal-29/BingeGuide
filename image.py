import json
import requests

# def get_id_img(type,title):
#     if(type=='Movie'):
#         data=requests.get('http://api.themoviedb.org/3/search/movie?api_key=f1cec2b9f63807f5c4fced888c47786d&query={}'.format(title)).text
#         data=json.loads(data)
#         a=data['results'][0]['id']
#         b='https://image.tmdb.org/t/p/w500'+str(data['results'][0]['poster_path'])
#     elif(type=='Series'):
#         data=requests.get('http://api.themoviedb.org/3/search/tv?api_key=f1cec2b9f63807f5c4fced888c47786d&query={}'.format(title)).text
#         data=json.loads(data)
#         a=data['results'][0]['id']
#         b='https://image.tmdb.org/t/p/w500'+str(data['results'][0]['poster_path'])
#     return b

def get_id_img(type,title):
    if(type=='Series'):
        a='tv'
    else:
        a='movie'
    b = ''
    try:
        data=requests.get('http://api.themoviedb.org/3/search/{}?api_key=f1cec2b9f63807f5c4fced888c47786d&query={}'.format(a,title)).text
        data=json.loads(data)
        # print(data)
        b='https://image.tmdb.org/t/p/w500'+str(data['results'][0]['poster_path'])
    except:
        pass
    return b


# a=get_id_img('Series','Breaking Bad')
# print(a)