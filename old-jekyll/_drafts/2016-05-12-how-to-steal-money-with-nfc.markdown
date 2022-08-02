---
layout: post
title: "How to steal money using a smartphone with NFC"
date: 2016-05-12 00:17:59 +0200
categories: tech
---
1.	Introduction
The purpose of this article is to highlight the possibility and methods by which a phone can read enough data off a bank card to fake a transaction, and also to present possibilities of preventing such incidents.





2.	Near field communication
Near field communication enables two electronic devices to establish communication by being within 4cm (1.5in) of each other. [ https://en.wikipedia.org/wiki/Near_field_communication @22.04.2016]

The communication can happen in two ways:

	1.2.1.	Unidirectional – one device, such as a smartphone, reads/writes from a passive device, such as a chip on a bank card;

	1.2.2.	Bidirectional – both devices communicate using the NFC protocol.

Applied to card transactions, NFC permits a fast reading of the financial information found on a card.





3.	Wireless bank cards
Not all bank cards are created equal. Not all of them can be read via NFC. Here’s how to spot one which can be read wirelessly:
Notice the little sign in the red circle? That’s it.





4.	The operation
Reading a wireless bank card with a smartphone is relatively easy



4.1.	Preparation
First, make sure the smartphone in question has the hardware for a NFC reader built in. If not, a NFC reader can be purchased externally. You can lookup if a phone has NFC on sites like GSMArena.

Then, get a NFC card reading app from your app store. The free versions of these apps do quite enough, there is no need to pay for any app.



4.2.	Reading via proximity
The card needs to be within 4cm of the phone. While the phone is listening via its NFC port, it will read the card quite quickly.

Here’s some of the information read:

Card owner name
Card number
Card expiration date
Card currency
The transfer logs may or may not be stored on the card.

Here is some information that is NOT read:

PIN number
Security number, written on the back of the card
If payments require this information, the fact that they are not read is a disadvantage to anyone trying to use this information for fraud or stealing.

Hence, encouraging the need for PIN number checking on transactions represents an advantage for the card owner.



4.3.	Reading via malware
Apps which require access to the NFC port of the phone could easily read credit card information, by standing by until they are in the proximity of any card. [http://www.idigitaltimes.com/new-android-nfc-attack-could-steal-money-credit-cards-anytime-your-phone-near-445497 ]


After that, the recorded credit card information can be forwarded to anyone who wishes to use it for their own intentions.



4.4.	Emulation
After reading the data from other cards, by using NFC credit card emulation software, a smartphone can be virtually transformed into a credit card. It can send the credit card information via its NFC port to any terminal of payment.

This method was previously experimented with [ http://komonews.com/news/local/digital-pickpockets-using-smartphones-to-steal-credit-cards-11-21-2015 ], and in this example, it worked 6 times out of 8. The other 2 times, the sellers assumed there was some error on their side.



5.	Backdrops
Although these methods can be used to make payments using another person’s credit card, the people making these payments can still be identified.

If done in person, payments will still leave a footprint consisting of a timestamp and location of payment. Authorities can later check for security camera recordings on the time and location of payment.

Even done online, the payments will still leave an obvious footprint consisting of IP addresses, which can be prevented by using secure browsers such as Tor. Another footprint consists of the destinations of purchases.



6.	Protection and prevention
Making sure one’s bank card cannot be read is simple – it only consists of a credit card pocket or sleeve, which is available for a very low cost, online. One can search for terms such as “RFID shielded sleeve protection for NFC card”.







This photo example was taken from an ebay product.

Cheap, easy to implement, this sleeve takes a subtle amount of space in one’s wallet, and upgrades, in a considerable manner, the security for the card owner.

Rather than a concrete tutorial on stealing money, this article tried to present, in brief terms, possible vulnerabilities and reasons why people should be more careful with wireless bank cards.

[how-to-steal-money-with-nfc-img01-nfc-card]: https://lh3.googleusercontent.com/mBp65TbGG0rpk2-zvHda9Hb7q9h2GhIK9ftJhS46jdS0u_EcToLkwfQS7zJrY85qUknbLafTFd99ZmOTyotVtcBciiAAb677eFeGyr1wI8g6wDGjxQetv_O96PtVUYRcmYvhDQ=w417-h274-no

[how-to-steal-money-with-nfc-img02-card-with-sleeve]: https://lh3.googleusercontent.com/s_NNHwk8miGkYP4-kcqNHKMSxn0yGeFef9RyAWyGkOrn31YK2IEoq_mVmaqcdkxEeCuqhp_aYPH1bgHrgkWr3qv3_Q3t23JZRalVIPJIhoCjxV72gdlV2KXj3jiMaZhoQoeIWw=w530-h371-no
