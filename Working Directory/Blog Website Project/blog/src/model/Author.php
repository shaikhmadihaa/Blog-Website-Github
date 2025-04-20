<?php
namespace App\Model;

class Author extends \Illuminate\Database\Eloquent\Model
{
    protected $fillable = ['id', 'name', 'username', 'password', 'email'];

    protected $table = 'users';

    public $incrementing = false; 
}
