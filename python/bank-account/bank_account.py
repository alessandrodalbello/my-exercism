from threading import Lock

class BankAccount:
    def __init__(self):
        self.is_open = False
        self.lock = Lock()

    def open(self):
        with self.lock:
            if not self.is_open:
                self.balance = 0
                self.is_open = True
            else:
                raise ValueError("The bank account is already open.")

    def get_balance(self):
        with self.lock:
            self.__verify_open()
            return self.balance

    def deposit(self, amount):
        if amount < 0:
            raise ValueError("Amount not valid. Deposit not allowed.")
        
        with self.lock:
            self.__verify_open()
            self.balance += amount

    def withdraw(self, amount):
        if amount < 0:
            raise ValueError("Amount not valid. Withdraw not allowed.")
        
        with self.lock:
            self.__verify_open()
            if self.balance >= amount:
                self.balance -= amount
            else:
                raise ValueError("Insufficient amount. Withdraw not allowed.")

    def close(self):
        with self.lock:
            self.__verify_open()
            self.is_open = False

    def __verify_open(self):
        if not self.is_open:
            raise ValueError("Operation denied. The bank account is not open.")
