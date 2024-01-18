

from unittest.mock import patch
import pytest
import sys
from typing import Any

sys.path.append('src/lastpass/')
from lastpass import LastPass


@pytest.fixture
def nvmn() -> LastPass:
    """
    Pytest fixture to provide a lastpass instance for each test.
    """
    test_nvmn = LastPass()
    test_nvmn.user_creation_url = "http://example.com/api"
    return test_nvmn


def test_initialization(nvmn: LastPass) -> None:
    """
    Test the initialization of LastPass.
    """
    assert nvmn.user_creation_url == "http://example.com/api"
