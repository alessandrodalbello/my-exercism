STATUS_WIN = "win"
STATUS_LOSE = "lose"
STATUS_ONGOING = "ongoing"


class Hangman:
    def __init__(self, word):
        self.word = word
        self.masked_word = '_' * len(word)
        self.remaining_guesses = 9
        self.guesses = set()
        self.status = STATUS_ONGOING

    def guess(self, char):
        if self.status != STATUS_ONGOING:
            raise ValueError("The game is already over.")

        if char not in self.guesses and char in self.word:
            for i, c in enumerate(self.word):
                if c == char:
                    self.masked_word = self.masked_word[:i] + c + self.masked_word[i + 1:]
            if "_" not in self.masked_word:
                self.status = STATUS_WIN
        else:
            if self.remaining_guesses > 0:
                self.remaining_guesses -= 1
            else:
                self.status = STATUS_LOSE
        self.guesses.add(char)

    def get_masked_word(self):
        return self.masked_word

    def get_status(self):
        return self.status
