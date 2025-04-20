<?php
$app->get('/news', function($request, $response){
    return $this->renderer->render($response, 'coming-soon.php', ['title' => 'News']);
});