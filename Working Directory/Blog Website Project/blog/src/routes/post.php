<?php

$app->get('/post/{id}', function ($req, $res, $args) {
    $id = $args['id'];
    $post = \App\Model\Post::find($id);

    if (!$post) {
        return $this->renderer->render($res, '404.php');
    }

    return $res->withRedirect('/post/'.$id.'/'.makeDashSeparatedString($post->title));
});

$app->get('/post/{id}/{title}', function ($req, $res, $args) {
    $id = $args['id'];
    $post = \App\Model\Post::find($id);

    if (!$post) {
        return $this->renderer->render($res, '404.php');
    }

    $post->update(['views' => $post->views + 1]);

    $htmlPost = \Parsedown::instance()
        ->setBreaksEnabled(false) // enables automatic line breaks
        ->text($post->body);
    $post->body = $htmlPost;

    $relatedPosts = $post->relatedPost();

    return $this->renderer->render(
        $res,
        'post.php',
        [
            'title' => $post->title,
            'meta' => $post->meta_desc,
            'post' => $post,
            'relatedPosts' => $relatedPosts,
        ]
    );
});

$app->post('/post/skip', function ($req, $res) {
    $body = $req->getParsedBody();
    $skip = $body['skip'];
    $posts = \App\Model\Post::where('status', 'approved')->latest()->limit(10)->skip($skip)->get();
    $postsInHtml = [];

    foreach ($posts as $post) {
        $mdToHtml = \Parsedown::instance()
            ->setBreaksEnabled(false) // enables automatic line breaks
            ->text($post->body);
        $post->body = $mdToHtml;

        $html = '
            <div class="card my-2 new-post" style="display:none">
                <div class="d-flex">
                    <div class="card-body">
                        <h1 class="card-title">'.$post->title.'</h1>
                        <div class="d-flex align-items-center justify-content-start">
                            <img class="profile-avatar" src="'.$post->users->avatar.'" alt="Avatar">
                            <a href="/user/'.$post->users->username.'"
                                class="px-2 text-primary font-weight-bold">'.$post->users->name.'</a>
                            <span class="font-weight-bold d-none d-sm-none d-md-block"> • '.$post->views.' views</span>
                            <span class="font-weight-bold px-1"> • '.htmlspecialchars($post->read_time).'</span>
                        </div>
                        <p class="card-text text-justify" style="margin-top:-17px">'.\App\Helper\Formater::truncateString($post->body, 135, ' ...').'</p>
                        <a class="btn btn-outline-primary btn-sm float-right font-weight-bold"
                            href="/post/'.$post->id.'/'.\App\Helper\Formater::space2dash($post->title).'">Read more</a>
                    </div>
                </div>
            </div>
        ';

        $postsInHtml[] = $html;
    }

    return $res->withJson($postsInHtml);
});

$app->post('/newsletter', function ($req, $res, $args) {
    $body = $req->getParsedBody();

    if (strlen($body['email']) < 1) {
        $data = array('msg' => 'Please enter your email');

        return $res->withJson($data)->withStatus(400);
    } elseif (!filter_var($body['email'], FILTER_VALIDATE_EMAIL)) {
        $data = array('msg' => 'Please enter a valid Email');

        return $res->withJson($data)->withStatus(400);
    } else {
        if (sizeof(\App\Model\NewsLetter::where('email', '=', $body['email'])->get()) > 0) {
            $data = array('msg' => 'You have already subscribed to our Newsletter');

            return $res->withJson($data)->withStatus(200);
        }

        \App\Model\NewsLetter::create([
            'id' => \Ramsey\Uuid\Uuid::uuid4(),
            'email' => $body['email'],
        ]);

        $data = array('msg' => 'Thank you for subscribing to our Newsletter');

        return $res->withJson($data)->withStatus(200);
    }
});
