<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    use HasFactory;

    protected $fillable = [
        'appointment_id',
        'action',
        'timestamp',
    ];

    public $timestamps = false; // We are manually managing the timestamp in the log entries
}
