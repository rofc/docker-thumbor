<?php

// Usage: php ./generate.php http://static.rofc.com.ar http://www.othersite.com/image.jpg THUMBOR_SECRET 250x250*/

$baseUrl        = $argv[1]; // http://my.thumbor-server.com
$imageUrl       = $argv[2]; // http://url.for-original-image.com/path-to.jpg
$secret         = $argv[3]; // xxxxxxxxxxxx
$imageSize      = $argv[4]; // 100x100

$safeMode = (boolean) ($secret != '');

$imagePath = $imageSize . '/smart/' . $imageUrl;
$signature = $safeMode ? sign($imagePath, $secret) : 'unsafe';

$thumborUrl = sprintf(
        '%s/%s/%s',
        $baseUrl,
        $signature,
        $imagePath
);

echo $thumborUrl . PHP_EOL;

function sign($msg, $secret)
{
        $signature = hash_hmac("sha1", $msg, $secret, true);
        return strtr(base64_encode($signature),'/+', '_-');
}
