"""Sample test to verify the project setup works correctly."""

from package_name import __version__


def test_version_is_string():
    """Verify that __version__ is a string."""
    assert isinstance(__version__, str)
