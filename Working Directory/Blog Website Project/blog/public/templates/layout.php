<!doctype html>
<html lang="en">

<head>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-148906684-1"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-148906684-1');
    </script>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Security-Policy" content="frame-src https://* ;">
    <meta name="description" content="<?=htmlspecialchars($meta); ?>">

    <!-- open graph meta data -->
    <meta property="og:site_name" content="Synchlab" />
    <meta property="og:title" content="<?=htmlspecialchars($title); ?>" />
    <meta property="og:type" content="article" />
    <meta property="article:author" content="Synchlab">
    <meta property="og:description" content="<?=isset($meta) ? htmlspecialchars($meta) : ''; ?>" />
    <meta property="og:url" content="<?=\App\Helper\URI::canonicalUri(); ?>" />
    <meta property="og:image" content="<?=isset($post->cover_img) ? $post->cover_img : ''; ?>" />

    <meta name="article_category" data-category="">
    <meta name="article_tags" content="">

    <meta name="twitter:url" content="https://techgi.in/">
    <meta name="twitter:title" content="<?=htmlspecialchars($title); ?>">
    <meta name="twitter:description" content="<?=isset($meta) ? htmlspecialchars($meta) : ''; ?>">
    <meta name="twitter:image" content="<?=isset($post->cover_img) ? $post->cover_img : ''; ?>">
    <meta name="twitter:creator" content="@synchlab">
    <meta name="twitter:card" content="<?=isset($post->cover_img) ? 'summary_large_image' : 'summary'; ?>">
    <meta name="twitter:site" content="@synchlab">

    <link rel="canonical" href="<?=\App\Helper\URI::canonicalUri(); ?>">

    <!-- Bootstrap CSS -->
    <link rel="icon" href="/images/favicon.png" type="image/gif" sizes="16x16">
    <link rel="stylesheet" href="/css/bootstrap.css?v=1.0.1">
    <link rel="stylesheet" href="/css/style.css?v=1.0.4">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;0,900;1,300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet"> 
    <title><?=htmlspecialchars($title); ?></title>

    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-9510320767708540",
        enable_page_level_ads: true
    });
</script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
        <a class="navbar-brand" href="/">
            <img class="logo" width="200px" src="/images/logo.png" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <?php $menu = getMenu(); ?>

                <?php foreach ($menu as $name => $menuItem): ?>

                <?php if (array_key_exists('path', $menuItem)): ?>
                <li class="nav-item <?= $menuItem['path'] == \App\Helper\URI::reqUri() ? 'active' : null; ?>">
                    <a class="nav-link" href="<?=$menuItem['path']; ?>"><?=$menuItem['name']; ?> <span
                            class="sr-only">(current)</span></a>
                </li>
                <?php else: ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?=ucfirst($name); ?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <?php foreach ($menuItem as $key => $subMenu): ?>
                        <?php if (strtolower($key) == 'separator'): ?>
                        <div class="dropdown-divider"></div>
                        <?php else: ?>
                        <a class="dropdown-item" href="/tutorials<?=$subMenu['path']; ?>"><?=$subMenu['name']; ?></a>
                        <?php endif; ?>
                        <?php endforeach; ?>
                    </div>
                </li>
                <?php endif; ?>
                <?php endforeach; ?>
            </ul>
            <form class="form-inline my-2 my-lg-0" method="GET" action="/search">
                <input class="form-control mr-sm-2" type="search" name="q" placeholder="Search" aria-label="Search">
                <button class="btn btn-secondary btn-search my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </nav>
    <div class="container">
        <?=$content; ?>
    </div>
    <div style="height:200px;"></div>
    <footer class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 mt-4 mb-2 text-center">
                    <!--
                    <a href="/"><img class="mb-2" width="200px" src="/images/logo.png" alt="logo"></a>
                    <p class="text-white text-justify">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                    -->
                    <div class="col-lg-12">
                        <a class="social-link facebook" target="_blank" href="https://www.facebook.com/synchlab/"><i
                                class="fab fa-facebook-square"></i></a>
                        <a class="social-link twitter" target="_blank" href="https://twitter.com/synchlab"><i
                                class="fab fa-twitter-square"></i></a>
                        <a class="social-link youtube" href="#"><i class="fab fa-youtube-square"></i></a>
                        <a class="social-link github" href="#"><i class="fab fa-github-square"></i></a>
                    </div>
                </div>
                <div class="col-lg-12 mb-4 d-flex flex-column flex-md-row justify-content-center align-items-center">
                    <a class="footer-link" href="/about">About</a>
                    <a class="footer-link" href="/advertise">Advertise</a>
                    <a class="footer-link" href="/privacy">Privacy</a>
                    <a class="footer-link" href="/contact">Contact</a>
                    <span class=" footer-link ">2025 &copy; <a target="_blank"
                            href="https://techgi.in/">techgi.in/</a></span>
                </div>
            </div>
        </div>
    </footer>
    
    <?php
    $pathToDisplayNewsletterModal = ['/about', '/advertise', '/privacy', '/contact'];
    $reqPath = \App\Helper\URI::reqUri();
    if (!in_array($reqPath, $pathToDisplayNewsletterModal)):?>
    <!-- Modal 
    <div class="modal fade" id="modal-newsletter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered font-weight-bold" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h1 style="font-size:8em" class="mt-3 mb-2 text-center text-primary"><i class="fas fa-envelope-open-text"></i></h1>
                    <h3 class="text-center font-weight-bold text-info">Don't want to miss anything?</h3>
                    <p class="text-center font-weight-light mx-4">Get updates on newest tutorials and tips right in your inbox. <br> Subscribe now!</p>
                    <form method="POST" class="px-4" id="formNewsletter" onsubmit="newsletterEmail(event)">
                        <div class="form-group">
                            <input type="text" class="form-control text-center" name="email" id="email" placeholder="email@example.com">
                            
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-form btn-block font-weight-bold">subscribe</button>
                        </div>
                    </form>
                    <div id="msg"></div>
                </div>
            </div>
        </div>
    </div>-->
    <?php endif; ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/js/jquery-3.4.1.js">
    </script>
    <script src="/js/popper.min.js">
    </script>
    <script src="/js/bootstrap.min.js">
    </script>
    <script
        src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?autoload=true&skin=desert">
    </script>
    <script src="/js/main.js?v=1.0.3"></script>
    <script id="dsq-count-scr" src="//synchlab-blog.disqus.com/count.js" async></script>

    <script>
        setTimeout(function(){
            $('#modal-newsletter').modal('show')
        }, 10000)
    </script>
</body>

</html>
