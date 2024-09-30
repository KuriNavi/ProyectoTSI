<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Fondo extends Model
{
    use HasFactory,SoftDeletes;

    protected $table='fondos';
    protected $hidden = ['deleted_at'];
    public $timestamps = false;

    public function usuarios():HasMany{
        return $this->hasMany(Usuario::class);
    }
}
