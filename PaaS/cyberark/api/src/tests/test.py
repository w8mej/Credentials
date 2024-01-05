from unittest.mock import patch
import pytest
import sys
from typing import Any

sys.path.append('src/cyberark/')
from cyberark import cyberark  # noqa: E402


@pytest.fixture
def nvmn() -> cyberark:
    """
    Pytest fixture to provide a cyberark instance for each test.
    """
    test_nvmn = cyberark()
    test_nvmn.user_creation_url = "http://example.com/api"
    return test_nvmn


def test_initialization(nvmn: cyberark) -> None:
    """
    Test the initialization of cyberark.
    """
    assert nvmn.user_creation_url == "http://example.com/api"
