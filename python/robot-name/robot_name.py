from random import choice, randint, seed

class Robot:
    __ALPHABET = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

    def __init__(self):
        self.name = self.__generate_name()

    def reset(self):
        self.name = self.__generate_name()

    def __generate_name(self):
        seed()
        code = choice(self.__ALPHABET) + choice(self.__ALPHABET)
        number = randint(0, 999)
        return f"{code}{number:03}"