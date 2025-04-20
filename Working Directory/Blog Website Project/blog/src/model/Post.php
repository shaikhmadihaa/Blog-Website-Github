<?php

namespace App\Model;

class Post extends \Illuminate\Database\Eloquent\Model
{
    use \Illuminate\Database\Eloquent\SoftDeletes;

    protected $fillable = ['id', 'title', 'cover_img', 'body', 'subject', 'users_id', 'views', 'comments', 'status'];

    public $incrementing = false;

    public function users()
    {
        return $this->belongsTo(\App\Model\User::class);
    }

    public function tags()
    {
        return $this->belongsToMany(\App\Model\Tag::class);
    }

    public static function getRecentPost()
    {
        return self::where('status', 'approved')->latest()->limit(1)->get();
    }

    public function relatedPost()
    {
        return Post::whereHas('tags', function ($query) {
            $tagIds = $this->tags()->pluck('tags.id')->all();
            $query->whereIn('tags.id', $tagIds);
        })->where('status', 'approved')->where('id', '<>', $this->id)->limit(5)->get();
    }
}
