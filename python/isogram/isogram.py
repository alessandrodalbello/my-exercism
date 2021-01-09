from collections import Counter
from re import sub

def is_isogram(string):
    s = sub(r"[^a-zA-Z]+", "", string).lower()
    counter = Counter(s)
    return not list(filter(lambda v: v > 1, counter.values()))
