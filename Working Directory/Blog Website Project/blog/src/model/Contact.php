<?php
namespace App\Model;

class Contact extends \Illuminate\Database\Eloquent\Model
{
    protected $fillable = ['id', 'name', 'email', 'message'];

    protected $table = 'contact';

    public $incrementing = false; 
}
