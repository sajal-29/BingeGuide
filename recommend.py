from flask import Flask, request, jsonify
import numpy as np
import pandas as pd
import difflib
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from image import get_id_img
import requests
from io import BytesIO

# Movies api route handling
path_movie="https://raw.githubusercontent.com/AakashRustagi7015/movies/main/movies.csv"
movies_data = pd.read_csv(path_movie)
selected_features = ['genres','keywords','tagline','cast','director']

for feature in selected_features:
    movies_data[feature] = movies_data[feature].fillna('')

combined_features = movies_data['genres']+' '+movies_data['keywords']+' '+movies_data['tagline']+' '+movies_data['cast']+' '+movies_data['director']
vectorizer = TfidfVectorizer()
feature_vectors = vectorizer.fit_transform(combined_features)
similarity = cosine_similarity(feature_vectors)

app = Flask(__name__)

@app.route('/api-movies', methods = ['GET'])
def movie():
    d={'ans':[]}
    movie_name = str(request.args['movies'])
    answer = movie_name
    list_of_all_titles = movies_data['title'].tolist()
    find_close_match = difflib.get_close_matches(answer, list_of_all_titles)
    close_match = find_close_match[0]
    index_of_the_movie = movies_data[movies_data.title == close_match]['index'].values[0]
    similarity_score = list(enumerate(similarity[index_of_the_movie]))
    sorted_similar_movies = sorted(similarity_score, key = lambda x:x[1], reverse = True) 

    for movie in sorted_similar_movies[:10]:
        index_movies = movie[0]
        movie_title = movies_data[movies_data.index==index_movies]['title'].values[0]
        movie_rating =movies_data[movies_data.index==index_movies]['vote_average'].values[0]
        img_url = get_id_img('movie', movie_title)
        d["ans"].append([movie_title, movie_rating, img_url])
    return d
            

path_series="https://raw.githubusercontent.com/AakashRustagi7015/BingeGuide/main/Netflix_Series_data.csv"
series_data=pd.read_csv(path_series)
series_data.isna().sum()
series_data.dropna(axis=0,inplace=True)
def prepare_data(x):
    return str.lower(str(x).replace(" ", ""))
features=['Genre','Tags','cast','Rating']
for new_feature in features:
    series_data.loc[:,new_feature] = series_data.loc[:,new_feature].apply(prepare_data)
series_data.set_index(keys='Title',inplace=True)
def create_features(x):
    return x['Genre'] + ' ' + x['Tags'] + ' ' +x['cast']+' '+ x['Rating']
series_data.loc[:, 'features'] = series_data.apply(create_features, axis = 1)
series_vector = TfidfVectorizer(stop_words='english')
vector_matrix = series_vector.fit_transform(series_data['features'])
cosine_sim2 = cosine_similarity(vector_matrix, vector_matrix)
series_data.reset_index(inplace = True)
indices = pd.Series(series_data.index, index=series_data['Title'])


@app.route('/api-series', methods = ['GET'])
def returnascii():
    s={'ans':[]}
    series_name = str(request.args['series'])
    # if(series_name=="office" or "theoffice" or "The office"):  
    #     series_name="The Office (U.K.)"
    
    series_answer = series_name
    list_of_series_title = series_data['Title'].tolist()
    find_close = difflib.get_close_matches(series_answer, list_of_series_title)
    close = find_close[0]
    indx=indices[close]
    sim_score=list(enumerate(cosine_sim2[indx]))
    sorted_sim_score = sorted(sim_score, key=lambda x: x[1], reverse=True)  
    for series in sorted_sim_score[1:11]:
        index_series = series[0]
        series_title = series_data[series_data.index==index_series]['Title'].values[0]
        series_rating =series_data[series_data.index==index_series]['Rating'].values[0]
        
        s["ans"].append([series_title,series_rating,get_id_img('Series',series_title)])
    return s

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)