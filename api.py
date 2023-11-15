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
path="https://raw.githubusercontent.com/AakashRustagi7015/movies/main/movies.csv"
movies_data = pd.read_csv(path)
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
        index = movie[0]
        title_from_index = movies_data[movies_data.index==index]['title'].values[0]
        movie_rating =movies_data[movies_data.index==index]['vote_average'].values[0]
        img_url = get_id_img('movie', title_from_index)
        d["ans"].append([title_from_index, movie_rating, img_url])
            
    return d
            


if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)
