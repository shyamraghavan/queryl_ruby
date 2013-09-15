<?php
require_once '/facebook.php'; //include the facebook php sdk
$facebook = new Facebook(array(
        'appId'  => '518326451580125',    //app id
        'secret' => '649faf21ca61e563966ce56974274bc6', // app secret
));
$user = $facebook->getUser();
if ($user) { // check if current user is authenticated
    try {
        // Proceed knowing you have a logged in user who's authenticated.
        $user_profile = $facebook->api('/me');  //get current user's profile information using open graph
            }
         catch(Exception $e){}
}
?>