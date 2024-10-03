<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{

    //protected $fillable = ['_token'];
    use HasFactory;
    protected $fillable = [
        'name',
        'age',
        'gender',
        'contact_information',
    ];
}
