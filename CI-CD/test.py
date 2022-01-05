from main import add, subtract


def test_add_two_positive_nums():
    assert add(2, 5) == 7


def test_add_negative_nums():
    assert add(-1, -2) == -3


def test_add_mixed_nums():
    assert add(-5, 5) == 0


def test_subtract():
    assert subtract(10, 3) == 7
