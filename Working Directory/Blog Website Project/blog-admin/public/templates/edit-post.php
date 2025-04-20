<div id="content-wrapper">

    <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Post</a>
            </li>
            <li class="breadcrumb-item active">Edit</li>
        </ol>

        <div class="row">
            <div class="col-lg-12">
                <?php if (isset($msg)):?>
                <div class="alert alert-success my-2"><strong>
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fas fa-check-circle"></i> Success! </strong> <?=$msg; ?>,
                    <a href="<?=$link; ?>">Please view your post here</a>
                </div>
                <?php endif; ?>
                <?php if (isset($error)):?>
                <div class="alert alert-danger my-2"><strong>
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fas fa-times"></i> Failed! </strong> <?=$error; ?>
                </div>
                <?php endif; ?>
                <div class="card mb-3">
                    <div class="card-body">
                        <form action="/post/edit" method="POST">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" name="title" class="form-control" placeholder="Enter title"
                                    value="<?php  echo isset($data) ? htmlspecialchars($data->title) : null; ?>">
                                <?php if (isset($errors)):?>
                                <small class="form-text text-danger"><?=$errors->title; ?></small>
                                <?php endif; ?>
                                <input type="hidden" name="id" value="<?=$data->id; ?>">
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>Cover image URI</label>
                                        <input type="text" name="cover_img" class="form-control"
                                            placeholder="Enter cover image url"
                                            value="<?php  echo isset($data) ? $data->cover_img : null; ?>">
                                        <?php if (isset($errors)):?>
                                        <small class="form-text text-danger"><?=$errors->cover_img; ?></small>
                                        <?php endif; ?>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>Subject</label>
                                        <select name="subject" id="" class="form-control">
                                            <option value="">--SELECT--</option>
                                            <option value="blog">Blog</option>
                                            <option value="entertainment">Entertainment</option>
                                            <option value="traveling">Traveling</option>
                                            <option value="fashion">Fashion</option>
                                            <option value="technology">Technology</option>
                                            <option value="health">Health</option>
                                            <option value="business">Business</option>
                                            <option value="food">Food</option>
                                            <option value="sports">Sports</option>
                                            <option value="education">Education</option>
                                            <option value="music">Music</option>
                                            <option value="lifestyle">Lifestyle</option>
                                            <option value="fitness">Fitness</option>
                                            <option value="finance">Finance</option>
                                            <option value="gaming">Gaming</option>
                                            <option value="politics">Politics</option>
                                            <option value="movies">Movies</option>
                                            <option value="photography">Photography</option>
                                            <option value="art">Art</option>
                                            <option value="diy">DIY</option>
                                            <option value="parenting">Parenting</option>
                                            <option value="pets">Pets</option>
                                            <option value="environment">Environment</option>
                                            <option value="social-media">Social Media</option>
                                            <option value="automobile">Automobile</option>

                                            <?php if (isset($data) && strlen($data->subject) > 0): ?>
                                                <option selected value="<?=$data->subject; ?>"><?=ucfirst($data->subject); ?></option>
                                            <?php endif; ?>
                                        </select>

                                        <?php if (isset($errors)):?>
                                        <small class="form-text text-danger"><?=$errors->subject; ?></small>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Article</label>
                                <textarea class="form-control" name="body" id="editor"
                                    placeholder="Article goes here....."><?php  echo isset($data) ? $data->body : null; ?></textarea>
                                <?php if (isset($errors)):?>
                                <small class="form-text text-danger"><?=$errors->body; ?></small>
                                <?php endif; ?>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label>Meta description</label>
                                    <textarea class="form-control" name="meta_desc"
                                        placeholder="Meta description"><?php  echo isset($data) ? $data->meta_desc : null; ?></textarea>
                                    <?php if (isset($errors)):?>
                                    <small class="form-text text-danger"><?=$errors->meta_desc; ?></small>
                                    <?php endif; ?>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>Tags</label> <br>
                                        <select multiple data-role="tagsinput" name="tags[]" class="form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary float-right mb-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>