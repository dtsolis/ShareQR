# Share QR

## Description

Simple page to generate and share QR Codes.

* Giving the `GET` parameter, `m`, a value, the page generates a QR Code.
* Use the `/download` endpoint to download the QR Image.
* By giving the `GET` parameter, `s`, a value, you can download the QR Code image in a different size.

**NOTE:** the download image size is valid when `120px <= selected size <=2000px`. Default value is `600px`.

## Usage

### Example 1

Share the message `my qr message`:

`http://share-qr.herokuapp.com/?m=my%20qr%20message`

### Example 2

Download the QR Code that contains the message `my qr message`, as an ***image***:

`http://share-qr.herokuapp.com/download?m=my%20qr%20message`

Download the same image with size of 1200x1200 pixels:

`http://share-qr.herokuapp.com/download?m=my%20qr%20message&s=1200`

