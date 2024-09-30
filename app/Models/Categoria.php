<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Categoria extends Model
{
    use HasFactory,SoftDeletes;

    protected $table='categorias';
    protected $hidden = ['deleted_at'];
    public $timestamps = false;

    public function actividades():HasMany{
        return $this->hasMany(Actividad::class);
    }
}
