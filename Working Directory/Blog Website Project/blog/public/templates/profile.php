<div class="row my-5">
    <div class="col-lg-8">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 profile-img text-center">
                <img class="avatar" src="<?=htmlspecialchars($user->avatar); ?>" alt="Avatar">
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 text-center text-md-left">
                <div
                    class="d-flex flex-column justify-content-center align-items-center">
                    <div class="col mt-3">
                        <div class="col-lg-12">
                            <h1 class="text-primary"> <?= htmlspecialchars($user->name); ?> </h1>
                        </div>
                        <div class="designation col-lg-12 font-weight-bold text-info">
                            <?= htmlspecialchars($user->work); ?>
                        </div>
                        <div class="social col-lg-12 my-3">
                            <?php if (strlen($user->facebook) > 0):?>
                            <a class="btn user-social-link facebook" target="_blank" href="<?= htmlspecialchars($user->facebook); ?>"><i
                                    class="fab fa-facebook"></i></a>
                            <?php endif; ?>
                            <?php if (strlen($user->facebook) > 0):?>
                            <a class="btn user-social-link twitter" target="_blank" href="<?= htmlspecialchars($user->twitter); ?>"><i
                                    class="fab fa-twitter"></i></a>
                            <?php endif; ?>
                            <?php if (strlen($user->facebook) > 0):?>
                            <a class="btn user-social-link linked-in" target="_blank" href="<?= htmlspecialchars($user->linkedin); ?>"><i
                                    class="fab fa-linkedin"></i></a>
                            <?php endif; ?>
                            <?php if (strlen($user->facebook) > 0):?>
                            <a class="btn user-social-link github" target="_blank" href="<?= htmlspecialchars($user->github); ?>"><i
                                    class="fab fa-github"></i></a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 my-5 about">
                <?=$user->about; ?>
            </div>
        </div>
    </div>

    <div class="col-lg-4">

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

    var images = document.querySelectorAll('.about img');
    images.forEach(function (img) {
        img.setAttribute('width', '100%');
    });
</script>