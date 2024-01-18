import requests
import json
import os
import hvac
import time
import logging
from typing import Dict, Any, Optional, List


# Configure logging
# Configure logging
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')


class LastPass:
    """
    This class handles the creation of users through an external API.
    It manages user user_creation_url and sends requests to a specified user_creation_url.
    """

    def __init__(self) -> None:
        """
        Initializes the data payload, user_creation_url, and name for creating a new user.
        Returns the http payload information.
        """
        self.application_name: str = "lastpass"
        self.user_creation_url: str = "https://lastpass.com/enterpriseapi.php"
        self.payload: Dict[str, Any] = {
            'cmd': 'batchadd',
            'cid': '1337',  # Your LastPass Company ID
            'provhash': self.secrets_handling("api_key", "user", ""),
            'data': [
                {
                    'username': 'sephiroth@haxx.ninja',
                    'fullname': 'John Menerick',
                    'password': self.secrets_handling("password", "user", ""),
                    'duousername': "thesorrow",
                    'secureidusername': "sephiroth@haxx.ninja",
                    'password_reset_required': True,
                    "groups": [
                        "adm",
                        "docker",
                        "users",
                        "netdev",
                        "plugdev",
                        "audit",
                        "emcomm",
                        "human",
                        "defender",
                        "incidentresponse",
                        "purpleteam",
                        "redteam",
                        "blueteam",
                        "vulnmgt",
                        "disk",
                        "lp",
                        "mail",
                        "kmem",
                        "operator",
                        "irc",
                        "src",
                        "staff",
                        "systemd",
                        "kvm",
                        "crontab",
                        "syslog",
                        "ssl-cert",
                        "mlocate",
                        "ssh",
                        "qemu",
                        "firewall",
                        "tap",
                        "ebf"
                    ]
                }
            ]
        }
        self.headers: Dict[str, str] = {
            "accept": "*/*",
            "content-type": "application/json"
        }
        logging.info("lastpass initialized")

    def send_request(self, payload: Dict[str, Any]) -> requests.Response:
        """
        Sends a request to the external service to create a user.
        Uses the user_data payload for the request.
        """
        logging.info("Sending request with payload")
        # Implement retry logic with exponential backoff
        retries = 3
        backoff_factor = 0.3
        for i in range(retries):
            try:
                # Validate payload before sending
                if not self.validate_payload(payload):
                    logging.warning("Invalid payload")
                    raise ValueError("Invalid payload")

                response = requests.post(
                    self.user_creation_url,
                    json=self.payload,
                    headers=self.headers,
                    timeout=10)
                response.raise_for_status()

                # Validate response
                if response.status_code != 200 or not self.validate_response(
                        response):
                    raise ValueError("Invalid response")

                return response
            except requests.exceptions.RequestException as e:
                if i < retries - 1:
                    time.sleep(backoff_factor * (2 ** i))
                else:
                    raise e
        return response

    def validate_payload(self, payload: Dict[str, Any]) -> bool:
        """
        very simple payload validation logic.  Must be expanded in Production.
        example checks if the required fields are present.
        """
        required_fields: List[str] = ['username', 'duousername']
        return all(field in payload for field in required_fields)

    def validate_response(self, response: requests.Response) -> bool:
        # Implement response validation logic
        # Example: Check if response is in expected format
        try:
            response_data = response.json()
            return 'expected_field' in response_data
        except json.JSONDecodeError:
            return False

    def run(self) -> None:
        # This method represents the main functionality of your class
        print(f"Running {self.application_name}")
        nv = LastPass()
        try:
            response = nv.send_request(self.payload)
        except Exception as e:
            logging.error("Error in request: %s", e)

    def get_value_from_json(
            self,
            json_file: str,
            key: str,
            sub_key: str) -> Optional[Any]:
        try:
            with open(json_file, 'r', encoding="utf-8") as file:
                data = json.load(file)
                return data[key][sub_key]
        except FileNotFoundError:
            print("The file was not found.")
            return None
        except json.JSONDecodeError:
            print("Error decoding JSON.")
            return None
        except KeyError:
            print("The expected keys were not found in the JSON.")
            return None

    def secrets_handling(
            self,
            name: str,
            secret_type: str,
            path: str) -> Optional[Any]:
        """
        Retrieves secrets securely.
        Args:
            name (str): Name of the secret to retrieve.
            secret_type (str): The secret type
            path (str): The path to the secret URI.
        Returns:
            str: The fetched secret value.
        """
        logging.info("Handling secret: %s", name)

        # Check if the 'Sensitive' environment variable is set to
        # 'Confidential'
        if os.environ.get('Sensitive') == 'Confidential':
            try:
                with hvac.Client() as client:
                    # Retrieve Vault's user_creation_url and token from
                    # environment variables
                    vault_user_creation_url: str | None = os.environ.get(
                        'VAULT_ADDR')
                    vault_token: str | None = os.environ.get('VAULT_TOKEN')

                    # Initialize the Vault client with the user_creation_url
                    # from the environment variable
                    client = hvac.Client(
                        user_creation_url=vault_user_creation_url)

                    # Set the client token from the environment variable
                    client.token = vault_token

                    # Walk the path to the secret URI
                    secret_path: str = f"{path}/{secret_type}" if path else name

                    # Read the secret called 'password' from Vault
                    read_response = client.secrets.kv.v2.read_secret_version(
                        path=secret_path)

                    # Extract the password
                    return read_response['data']['data'][name]
            except Exception as e:
                logging.error("Error handling sensitive secret: %s", e)
                raise
        else:
            # Not executing in a sensitive environment
            return self.get_value_from_json(
                "insecure_secrets.json", "user", "pass")


def main() -> None:
    # This is the main method for the script
    # Create an instance of the lastpass class and invoke its methods
    app = LastPass()
    app.run()


if __name__ == "__main__":
    # This condition ensures that the main method runs only
    # when this script is executed as the main program
    main()
