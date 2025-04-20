<?php

$app->get('/', function ($request, $response, $args) {
    $recentPost = \App\Model\Post::getRecentPost();
    $posts = \App\Model\Post::where('status', 'approved')->latest()->limit(12)->skip(1)->get();

    /**TODO: need to fetch 12, but there only 8 now */
    $tags = \App\Model\Tag::all()->random(8);

    $popularPosts = \App\Model\Post::where('status', 'approved')->OrderBy('views', 'DESC')->take(5)->get();

    return $this->renderer->render($response, 'index.php', [
        'title' => 'Online Web, Mobile Development Tutorials - Synchlab.dev',
        'meta' => 'Fun and practical Web, Mobile development tutorial for beginner and advanced learners',
        'recentPosts' => $recentPost,
        'posts' => $posts,
        'tags' => $tags,
        'popular_posts' => $popularPosts,
    ]);
});

$app->get('/search', function ($req, $res, $args) {
    $body = $req->getQueryParams();
    $q = $body['q'];

    if (strlen($q) < 1) {
        return $res->withRedirect('/');
    }

    $posts = \App\Model\Post::where('title', 'like', '%'.$q.'%')->where('status', 'approved')->get();

    return $this->renderer->render($res, 'search.php', [
        'title' => 'You searched for '.$q.' - Synchlab.dev',
        'meta' => 'Fun and practical Web, Mobile development tutorial for beginner and advanced learners',
        'posts' => $posts,
    ]);
});

$app->get('/tag/{name}', function ($req, $res, $args) {
    $tags = $args['name'];

    if (strlen($tags) < 1) {
        return $res->withRedirect('/');
    }

    $tag = \App\Model\Tag::where('name', $tags)->first();

    $tagmapper = \App\Model\TagMap::where('tag_id', $tag->id)->get();
    $postIds = [];

    foreach ($tagmapper as $tagmap) {
        $postIds[] = $tagmap->post_id;
    }

    $posts = \App\Model\Post::find($postIds);

    $approvedPost = [];

    /**TODO:
     * Have to find some better way to do it. Probably in eloquent query.
     * This will be resource consuming if lots of post comes
     */

    foreach ($posts as $post) {
        if ($post->status !== 'approved') {
            continue;
        }

        $approvedPost[] = $post;
    }

    return $this->renderer->render($res, 'search.php', [
        'title' => "$tags - Synchlab.dev",
        'meta' => isset($posts[0]) && $posts[0] !== null ? strip_tags($posts[0]->meta_desc) : '',
        'posts' => $approvedPost,
    ]);
});

$app->get('/tutorials/{name}', function ($req, $res, $args) {
    $subject = $args['name'];
    if (strlen($subject) < 1) {
        return $res->withRedirect('/');
    }

    $posts = \App\Model\Post::where('subject', '=', $subject)->where('status', 'approved')->get();

    return $this->renderer->render($res, 'search.php', [
        'title' => "Tutorials for $subject - Synchlab.dev",
        'meta' => strip_tags($posts[0]->meta_desc),
        'posts' => $posts,
    ]);
});

$app->get('/about', function ($request, $response) {
    return $this->renderer->render($response, 'about.php', [
        'title' => 'About - Synchlab.dev',
        'meta' => '',
    ]);
});

$app->get('/advertise', function ($request, $response) {
    return $this->renderer->render($response, 'advertise.php', [
        'title' => 'Advertise - Synchlab.dev',
        'meta' => '',
    ]);
});

$app->get('/privacy', function ($request, $response) {
    return $this->renderer->render($response, 'privacy.php', [
        'title' => 'Privacy Policy - Synchlab.dev',
        'meta' => '',
    ]);
});

$app->get('/contact', function ($request, $response) {
    return $this->renderer->render($response, 'contact.php', [
        'title' => 'Contact - Synchlab.dev',
        'meta' => '',
    ]);
});

$app->post('/author', function ($req, $res, $args) {
    $body = $req->getParsedBody();

    $errors = [
        'name' => '',
        'username' => '',
        'password' => '',
        'email' => '',
    ];

    $isError = false;

    if (strlen($body['name']) < 1) {
        $errors['name'] = 'Enter your name';
        $isError = true;
    }
    if (strlen($body['name']) > 150) {
        $errors['name'] = 'Name should be less than 150 character';
        $isError = true;
    }

    if (strlen($body['email']) < 1) {
        $errors['email'] = 'Enter your email';
        $isError = true;
    }
    if (!filter_var($body['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Enter a valid email';
        $isError = true;
    }

    if ($isError) {
        $payload = json_encode($errors, JSON_UNESCAPED_SLASHES);

        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(400);
    }

    if (sizeof(\App\Model\Author::where('email', '=', $body['email'])->get()) > 0) {
        $success = array('msg' => 'You have already applied for becoming an author');
        $payload = json_encode($success, JSON_UNESCAPED_SLASHES);
        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(200);
    }

    $input = [
        $password = password_hash($body['password'], PASSWORD_DEFAULT),
        'id' => \Ramsey\Uuid\Uuid::uuid4(),
        'name' => $body['name'],
        'username' => $body['username'],
        'password' => $password,
        'email' => $body['email'],
    ];

    if (\App\Model\Author::create($input)) {
        $success = array('msg' => 'Thank you for regsister! Please Login admin author pannel');
        $payload = json_encode($success, JSON_UNESCAPED_SLASHES);
        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(200);
    } else {
        $error = array('msg' => 'Internal server error');
        $payload = json_encode($error, JSON_UNESCAPED_SLASHES);
        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(500);
    }
});


$app->post('/contact', function ($req, $res, $args) {
    $body = $req->getParsedBody();

    $errors = [
        'name' => '',
        'email' => '',
        'message' => '',
    ];

    $isError = false;

    if (strlen($body['name']) < 1) {
        $errors['name'] = 'Enter your name';
        $isError = true;
    }
    if (strlen($body['name']) > 150) {
        $errors['name'] = 'Name should be less than 150 character';
        $isError = true;
    }

    if (strlen($body['email']) < 1) {
        $errors['email'] = 'Enter your email';
        $isError = true;
    }
    if (!filter_var($body['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'Enter a valid email';
        $isError = true;
    }

    if (strlen($body['message']) < 1) {
        $errors['message'] = 'Enter your message';
        $isError = true;
    }

    if ($isError) {
        $payload = json_encode($errors, JSON_UNESCAPED_SLASHES);

        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(400);
    }

    $input = [
        'id' => \Ramsey\Uuid\Uuid::uuid4(),
        'name' => $body['name'],
        'email' => $body['email'],
        'message' => $body['message'],
    ];

    if (\App\Model\Contact::create($input)) {
        $success = array('msg' => 'Thank you ! We will contact you very soon');
        $payload = json_encode($success, JSON_UNESCAPED_SLASHES);
        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(200);
    } else {
        $error = array('msg' => 'Internal server error');
        $payload = json_encode($error, JSON_UNESCAPED_SLASHES);
        $res->getBody()->write($payload);

        return $res->withHeader('Content-Type', 'application/json')->withStatus(500);
    }
});
