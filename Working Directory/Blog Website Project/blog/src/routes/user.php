<?php
$app->get('/user/{username}', function ($req, $res, $args) {
    $username = $args['username'];

    if (strlen($username) < 1) {
        return $this->renderer->render($res, '404.php');
    }
    $user = \App\Model\User::where('username', $username)->first();

    if ($user === null) {
        return $this->renderer->render($res, '404.php');
    }

    $about = \Parsedown::instance()
        ->setBreaksEnabled(false)
        ->text($user->about);
    $user->about = $about;

    return $this->renderer->render($res, 'profile.php', [
        'title' => "$user->name - Synchlab.dev",
        'meta' => \App\Helper\Formater::truncateString(strip_tags($user->about), 150, '...'),
        'user' => $user
    ]);
});
