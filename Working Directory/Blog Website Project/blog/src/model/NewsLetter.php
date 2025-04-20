<?php
namespace App\Model;

class NewsLetter extends \Illuminate\Database\Eloquent\Model
{
    protected $fillable = ['id', 'email'];

    protected $table = 'newsletter';

    public $incrementing = false; 
}
