<div class="row">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
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

    <div class="col-lg-3">

    </div>
</div>