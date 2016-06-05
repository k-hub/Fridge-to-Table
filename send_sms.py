"""Use Twilio to sent shopping list to user."""

from twilio.rest import TwilioRestClient
import os

def send_sms(shopping_list):
    account_sid = os.environ["TWILIO_ACCOUNT_SID"]
    auth_token = os.environ["TWILIO_AUTH_TOKEN"]
    sender = os.environ["SENDER"]
    recipient = os.environ["RECIPIENT"]



    client = TwilioRestClient(account_sid, auth_token)

    message = client.sms.messages.create(to=recipient, from_=sender, body="Shopping List:\n" + shopping_list)
