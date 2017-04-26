---
layout: post
title:  "[Java] Importing JSON from files adds extra characters, resulting in JsonParseException"
date:   2017-04-21 04:39:00 +0200
categories: tech
---



## Given the following JSON file

{% highlight json %}
﻿{  "posts" : [ ]}
{% endhighlight %}

## Java import this file and adds an extra character right at the beginning

This results in the following error when that JSON is parsed:

{% highlight properties %}
com.fasterxml.jackson.core.JsonParseException: Unexpected character ('-' (code 65279 / 0xfeff)): expected a valid value (number, String, array, object, 'true', 'false' or 'null')
 at [Source: ﻿{  "posts" : [ ]}; line: 1, column: 2]

	at com.fasterxml.jackson.core.JsonParser._constructError(JsonParser.java:1581)
	at com.fasterxml.jackson.core.base.ParserMinimalBase._reportError(ParserMinimalBase.java:533)
	at com.fasterxml.jackson.core.base.ParserMinimalBase._reportUnexpectedChar(ParserMinimalBase.java:462)
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser._handleOddValue(ReaderBasedJsonParser.java:1624)
	at com.fasterxml.jackson.core.json.ReaderBasedJsonParser.nextToken(ReaderBasedJsonParser.java:689)
	at com.fasterxml.jackson.databind.ObjectMapper._initForReading(ObjectMapper.java:3776)
	at com.fasterxml.jackson.databind.ObjectMapper._readMapAndClose(ObjectMapper.java:3721)
	at com.fasterxml.jackson.databind.ObjectMapper.readValue(ObjectMapper.java:2726)
{% endhighlight %}

## Short answer solution

Replacing the first occurrence of the extra added string with a method such as the following should fix this issue:

{% highlight java %}
  public String cleanUpJsonBOM(String json) {
      return json.trim().replaceFirst("\ufeff", "");
  }
{% endhighlight %}

# Explanation
If we attempt to modify the **"cleanUpJsonBOM()"** method to replace the extra character with something else, such as "HEREIAM":

{% highlight java %}
  public String cleanUpJsonBOM(String json) {
      return json.trim().replaceFirst("\ufeff", "HEREIAM");
  }
{% endhighlight %}

We will then get the following string:

{% highlight json %}
  HEREIAM{  "posts": [  ]}
{% endhighlight %}

***There's our culprit.*** Without replacing this bytecode, the **"\ufeff"** characters would not be visible in debug mode, only within the stacktrace. It is only after replacing these characters that we can detect where the extra BOM was added.
The root of the problem lies in added **[byte order marks][wiki-byte-order-marks]{:target="_blank"}** at the beginning of text streams, which are used to signal needed properties to the text stream consumer.

Fortunately, **[Mark S. Kolich][maro-koli-ch-xml-parse-exception]{:target="_blank"}** detected this problem with .XML files, which provided a clue towards solving the issue in this post.


[wiki-byte-order-marks]: https://en.wikipedia.org/wiki/Byte_order_mark

[maro-koli-ch-xml-parse-exception]: http://mark.koli.ch/resolving-orgxmlsaxsaxparseexception-content-is-not-allowed-in-prolog
