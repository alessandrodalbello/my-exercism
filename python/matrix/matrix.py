class Matrix:
    def __init__(self, matrix_string):
        rows = matrix_string.split("\n")
        self.matrix = list(map(lambda row: self.__ints(row), rows))

    def __ints(self, row):
        numbs = row.split(" ")
        return list(map(lambda n: int(n), numbs))

    def row(self, index):
        return self.matrix[index - 1]

    def column(self, index):
        return list(map(lambda row: row[index - 1], self.matrix))
