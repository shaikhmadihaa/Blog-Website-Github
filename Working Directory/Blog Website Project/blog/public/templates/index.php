<div class="row">
    <div class="col-lg-3 d-none d-md-block">
        <div class="card mt-2">
            <div class="card-header">
                <h2>Category</h2>
            </div>
            <div class="card-body">
                <?php foreach ($tags as $tag): ?>
                <a href="/tag/<?=htmlspecialchars($tag->name); ?>"
                    class="btn btn-secondary btn-sm my-1 font-weight-bold">#<?= htmlspecialchars($tag->name); ?></a>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div id="post-container">

            <?php foreach ($recentPosts as $recentPost): ?>
            <div class="card  mt-2 w-100">
                <img src="<?=htmlspecialchars($recentPost->cover_img); ?>" class="card-img-top"
                    alt="<?= htmlspecialchars($recentPost->title); ?>">
                <div class="card-body">
                    <h1 class="card-title"><?= htmlspecialchars($recentPost->title); ?></h1>

                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <a href="/user/<?= htmlspecialchars($recentPost->users->username); ?>">
                                <img class="profile-avatar" src="<?=htmlspecialchars($recentPost->users->avatar); ?>"
                                    alt="<?= htmlspecialchars($recentPost->users->name); ?>">
                            </a>
                            <a href="/user/<?= htmlspecialchars($recentPost->users->username); ?>"
                                class="pl-2 text-primary font-weight-bold"><?= htmlspecialchars($recentPost->users->name); ?>
                            </a>
                            <span class="font-weight-bold ml-sm-2 d-none d-sm-none d-md-inline"> •
                                <?=htmlspecialchars($recentPost->views); ?> views</span>
                            <span class="font-weight-bold px-1">• <?=htmlspecialchars($recentPost->read_time); ?></span>
                        </div>
                    </div>
                    <p class="card-text text-justify">
                        <?=App\Helper\Formater::truncateString($recentPost->body, 150, ' ...'); ?></p>
                    <a class="btn btn-outline-primary btn-sm float-right font-weight-bold"
                        href="/post/<?=htmlspecialchars($recentPost->id); ?>/<?=App\Helper\Formater::space2dash($recentPost->title); ?>">Read
                        more</i></a>
                </div>
            </div>
            <?php endforeach; ?>
            <?php foreach ($posts as $post): ?>
            <div class="card my-2">
                <div class="d-flex">
                    <div class="card-body">
                        <h1 class="card-title"><?=htmlspecialchars($post->title); ?></h1>
                        <div class="d-flex align-items-center justify-content-start">
                            <img class="profile-avatar" src="<?=htmlspecialchars($post->users->avatar); ?>"
                                alt="<?=htmlspecialchars($post->users->name); ?>">
                            <a href="/user/<?= htmlspecialchars($post->users->username); ?>"
                                class="px-2 text-primary font-weight-bold"><?=htmlspecialchars($post->users->name); ?></a>
                            <span class="font-weight-bold d-none d-sm-none d-md-block"> •
                                <?=htmlspecialchars($post->views); ?> views</span>
                            <span class="font-weight-bold px-1"> • <?=htmlspecialchars($post->read_time); ?></span>
                        </div>
                        <p class="card-text text-justify">
                            <?=App\Helper\Formater::truncateString($post->body, 150, ' ...'); ?></p>
                        
                        <a class="btn btn-outline-primary btn-sm float-right font-weight-bold"
                            href="/post/<?=htmlspecialchars($post->id); ?>/<?=App\Helper\Formater::space2dash($post->title); ?>">Read
                            more</i></a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>

        <div class="col-md-12 text-center">
            <a class="btn btn-load-more text-muted" data-skip="12" onclick="loadMorePost(this)"> <i class="fas fa-redo"
                    id="load-more"></i> </a>
            <p class="text-muted" id="load-more-label">Load more...</p>
        </div>
    </div>

    <div class="col-lg-3 d-none d-md-block">
        <div class="card my-2">
            <div class="card-header">
                <h2>Popular</h2>
            </div>
            <?php $i = 0; foreach ($popular_posts as $popular): ?>
                <a class="popular <?php echo $i == 4 ? 'last' : null; ?>" href="/post/<?=htmlspecialchars($popular->id); ?>/<?=App\Helper\Formater::space2dash($popular->title); ?>">
                    <div>     
                        <span class="popular-title"><?= htmlspecialchars($popular->title); ?></span>
                        <ul>
                            <li><small><?= \App\Helper\Formater::dateFormat($popular->created_at, 'd-M-Y'); ?></small></li>
                            <li> <small>• <?=$popular->read_time; ?></small></li>
                        </ul>
                    </div>
                </a>
            <?php ++$i; endforeach; ?>
        </div>

    </div>
</div>