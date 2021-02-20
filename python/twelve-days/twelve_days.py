ordinals = [
    'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
    'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth'
]
gifts = [
    'a Partridge in a Pear Tree', 'two Turtle Doves', 'three French Hens',
    'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying',
    'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing',
    'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming'
]

def recite(start_verse, end_verse):
    if start_verse not in range(1, 13) or end_verse not in range(1, 13) or start_verse > end_verse:
        raise ValueError("Invalid input.")
    return [ __recite(v) for v in range(start_verse - 1, end_verse) ]

def __recite(verse):
    return f"On the {ordinals[verse]} day of Christmas my true love gave to me: {__recite_gifts(verse)}."

def __recite_gifts(verse): 
    gifts_list = ""
    for v in range(verse, 0, -1):
        gifts_list += f"{gifts[v]}, "
    if verse > 0:
        gifts_list += "and "
    return gifts_list + gifts[0]