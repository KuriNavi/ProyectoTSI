<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Actividad extends Model
{
    use HasFactory,SoftDeletes;

    protected $table='actividades';
    protected $hidden = ['deleted_at'];
    public $timestamps = false;

    public function categoria():BelongsTo{
        return $this->belongsTo(Categoria::class);
    }

    public function usuario():BelongsTo{
        return $this->belongsTo(Usuario::class);
    }
}
