def is_isogram(string):
    chars = set()
    for c in string.lower():
        if c.isalpha():
            if c not in chars:
                chars.add(c)
            else:
                return False
    return True
