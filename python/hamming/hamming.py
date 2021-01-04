def distance(strand_a, strand_b):
    l = len(strand_a)
    if (len(strand_b) != l):
        raise ValueError("It is not possible to compare the strands. They must have the same length.")

    distance = 0
    i = 0
    while i < l:
        if strand_a[i] != strand_b[i]:
            distance += 1
        i += 1
    return distance