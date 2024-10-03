<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    // Fillable attributes for mass assignment
    protected $fillable = [
        'name',
        'specialization',
        'contact_information',
    ];
}
