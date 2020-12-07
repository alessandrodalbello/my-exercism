import unittest

from two_fer import two_fer


class TwoFerTest(unittest.TestCase):
    def test_no_name_given(self):
        self.assertEqual(two_fer(), "One for you, one for me.")

    def test_a_name_given(self):
        self.assertEqual(two_fer("Alessandro"), "One for Alessandro, one for me.")

    def test_another_name_given(self):
        self.assertEqual(two_fer("Betta"), "One for Betta, one for me.")


if __name__ == "__main__":
    unittest.main()
