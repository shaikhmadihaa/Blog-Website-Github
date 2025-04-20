<?php
namespace App\Model;

class User extends \Illuminate\Database\Eloquent\Model
{
    public $incrementing = false; 

    public function posts()
    {
        return $this->hasMany(\App\Model\Post::class);
    }
}
