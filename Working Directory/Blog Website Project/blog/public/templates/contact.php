<div class="row mt-5">
    <div class="col-lg-6 col-md-6 col-sm-12 mt-3">
        <div class="card">
            <div class="card-body text-center">
                <h1 class="card-title">Register</h1>
                <p class="card-text">
                    Great, we welcome people who want to write tutorials and technical articles.
                </p>

                <a class="btn btn-primary text-white font-weight-bold" data-toggle="modal"
                    data-target="#modal-author">Register Now</a>
            </div>
        </div>
        <div class="text-right my-2" id="msgForAuthor"></div>

    </div>

    <div class="col-lg-6 col-md-6 col-sm-12 mt-3">
        <div class="card">
            <div class="card-body text-center">
                <h1 class="card-title">Get in touch</h1>
                <p class="card-text">
                    If you have any questions, please feel free to drop a line.
                </p>

                <a class="btn btn-primary text-white font-weight-bold" data-toggle="modal"
                    data-target="#modal-contact">Leave a message</a>
            </div>
        </div>
        <div class="text-right my-2" id="msgForContact"></div>
    </div>

</div>

<div class="push-150"></div>

<!-- Modal -->
<div class="modal fade" id="modal-author" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Want to become an author regsiter now</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body font-weight-bold">
                <form id="formAuthor" method="POST" >
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" aria-describedby="emailHelp"
                            placeholder="Enter name">
                        <span class="help text-danger" id="e-name"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter Username">
                        <span class="help text-danger" id="e-username"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="password" name="password" placeholder="Enter password">
                        <span class="help text-danger" id="e-password"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
                        <span class="help text-danger" id="e-email"></span>
                    </div>

                    
                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-form font-weight-bold" data-dismiss="modal">Close</button>
                <button type="button" id="author-submit" class="btn btn-primary btn-form font-weight-bold">Apply</button>
            </div>
          
        </div>
    </div>
    <div class="text-right my-2" id="msgForAuthor"></div>
</div>


<div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Leave a message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body font-weight-bold" id="modal">
                <form id="formContact" method="post" >
                    <div class="form-group">
                        <input type="text" class="form-control" id="c-name" name="name" aria-describedby="emailHelp"
                            placeholder="Enter name">
                        <span class="help text-danger" id="namee"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="c-email" name="email" placeholder="Enter email">
                        <span class="help text-danger" id="emaill"></span>
                    </div>

                    <div class="form-group">
                        <textarea rows="8" type="text" class="form-control" name="message" id="message"
                            placeholder="Message"></textarea>

                        <span class="help text-danger" id="messag"></span>
                    </div>
                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-form font-weight-bold" data-dismiss="modal">Close</button>
                <button type="button" id="btn-submit" class="btn btn-primary btn-form font-weight-bold">Submit</button>
            </div>
          
        </div>
    </div>
    <div class="text-right my-2" id="msgForContact"></div>
</div>