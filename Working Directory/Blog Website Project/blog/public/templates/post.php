<div class="row mt-2">
    <div class="col-lg-8 offset-lg-2 mb-3 post-body">
        <div class="article-header px-2">
            <h1 class="mt-4"><?= htmlspecialchars($post->title); ?></h1>

            <div class="d-flex align-items-center justify-content-start my-3 ">
                <img class="profile-avatar" src="<?=htmlspecialchars($post->users->avatar); ?>" alt="<?= htmlspecialchars($post->users->name); ?>">
                <a href="/user/<?=htmlspecialchars($post->users->username); ?>"
                    class="pl-2 font-weight-bold"><?= htmlspecialchars($post->users->name); ?></a>
                <span class="font-weight-bold pl-3"> <?=htmlspecialchars($post->views); ?> Views</span>
                <span class="font-weight-bold px-1 d-none d-sm-none d-md-block"> • 
                    <?=\App\Helper\Formater::dateFormat($post->created_at, 'd-M-Y'); ?></span>
                    <span class="font-weight-bold px-1"> • <?=htmlspecialchars($post->read_time); ?></span>
            </div>
        </div>

        <div class="article">
            <?php if (strlen($post->cover_img) > 0): ?>
            <img class="mb-3" src="<?=htmlspecialchars($post->cover_img); ?>" alt="<?=htmlspecialchars($post->title); ?>">
            <?php endif; ?>

            <?=$post->body; ?>
        </div>
    </div>
    <div class="col-lg-2">
        <div class="row">
            <div class="col-lg-12 mb-3 d-sm-block d-md-block d-lg-none">
                <a href="https://www.facebook.com/sharer.php?u=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-facebook"><i class="fab fa-facebook"></i></a>
                <a href="https://twitter.com/intent/tweet?url=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-twitter"><i class="fab fa-twitter"></i></a>
                <a href="https://www.linkedin.com/shareArticle?mini=true&url=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-linkedin"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>

        <?php if (count($relatedPosts) > 0):?>
        <div class="card">
            <div class="card-header">
                <h2>Related posts</h2>
            </div>
            <?php $i = 0; foreach ($relatedPosts as $relatedPost): ?>
                <a class="popular <?php echo $i == 4 ? 'last' : null; ?>" href="/post/<?=htmlspecialchars($relatedPost->id); ?>/<?=App\Helper\Formater::space2dash($relatedPost->title); ?>">
                    <div>     
                        <span class="popular-title"><?= htmlspecialchars($relatedPost->title); ?></span>
                        <ul>
                            <li><small><?= \App\Helper\Formater::dateFormat($relatedPost->created_at, 'd-M-Y'); ?></small></li>
                            <li> <small>• <?=$relatedPost->read_time; ?></small></li>
                        </ul>
                    </div>
                </a>
            <?php ++$i; endforeach; ?>
        </div>
        <?php endif; ?>
    </div>

    <div class="row">
        <div class="col-lg-12 ml-3 my-3 d-none d-lg-block">
            <a href="https://www.facebook.com/sharer.php?u=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-facebook"><i class="fab fa-facebook"></i></a>
            <a href="https://twitter.com/intent/tweet?url=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-twitter"><i class="fab fa-twitter"></i></a>
            <a href="https://www.linkedin.com/shareArticle?mini=true&url=<?=\App\Helper\URI::canonicalUri(); ?>" class="btn btn-share btn-share-linkedin"><i class="fab fa-linkedin"></i></a>
        </div>
    </div>
</div>
<textarea  id="copy-text-holder"></textarea>
<div class="col-lg-12 mt-5">
    <div id="disqus_thread"></div>
    <script>
        /**
         *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
         *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
         */


        var disqus_config = function () {
            this.page.url =
                '<?=\App\Helper\URI::canonicalUri(); ?>'; // Replace PAGE_URL with your page's canonical URL variable
            this.page.identifier = <?= "'$post->id'"; ?>
            ; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
        };

        (function () { // DON'T EDIT BELOW THIS LINE
            var d = document,
                s = d.createElement('script');
            s.src = 'https://synchlab-blog.disqus.com/embed.js';
            s.setAttribute('data-timestamp', +new Date());
            (d.head || d.body).appendChild(s);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by
            Disqus.</a></noscript>

</div>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <i class="fa fa-check-circle text-success my-2" style="font-size:70px;"></i>
                <div class="text-success font-weight-bold" style="font-size:24px" id="getCode">
                </div>
                <button class="btn btn-primary btn-block mt-4 font-weight-bold" data-dismiss="modal"> OK </button>
            </div>
        </div>
    </div>
</div>

<script>
    var pres = document.querySelectorAll('pre');
    pres.forEach(function (pre) {
        pre.classList.add('prettyprint');
    });

    var paragraphs = document.querySelectorAll('p');
    paragraphs.forEach(function (p) {
        p.classList.add('text-justify');
    })

    var images = document.querySelectorAll('.article img');
    images.forEach(function (img) {
        img.setAttribute('width', '100%');
    });

    let copyId = 0;
    pres.forEach(function (pre) {
        copyId++;
        pre.setAttribute('data-copyid', copyId);
        let el = document.createElement('div');
        el.classList += 'pre-wrapper'
        pre.parentNode.insertBefore(el, pre);
        el.appendChild(pre);
        const copyBtn = document.createElement('button');
        copyBtn.setAttribute('data-target', copyId);
        copyBtn.setAttribute('onclick', 'copy(this)');
        copyBtn.classList = 'btn-copy';
        copyBtn.innerHTML = '<i class="fas fa-clipboard"></i>';
        el.appendChild(copyBtn)

    });

    function copy(obj) {
        let targetId = obj.getAttribute('data-target');
        const textHolder = document.querySelector('#copy-text-holder');
        let targetEl = document.querySelectorAll('[data-copyid="' + targetId + '"] code');
        textHolder.value = targetEl[0].textContent;
        textHolder.select();
        try {
            document.execCommand('copy');
            obj.innerHTML = '<i class="fas fa-clipboard-check"></i>';
            obj.classList = 'btn-copy done'
        } catch (err) {
            obj.innerHTML = '<i class="fas fa-times"></i>';
            obj.classList = 'btn-copy error'
        }

        setTimeout(function () {
            obj.innerHTML = '<i class="fas fa-clipboard"></i>';
            obj.classList = 'btn-copy'
        }, 3000);

    }
</script>
