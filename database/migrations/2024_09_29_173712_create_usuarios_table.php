<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->integer('id')->autoIncrement();
            $table->string('nombre_usuario',50);
            $table->string('correo',50);
            $table->string('password',200);
            $table->boolean('plus');
            $table->integer('id_fondo');
            $table->tinyInteger('id_rol');
            $table->foreign('id_fondo')->references('id')->on('fondos');
            $table->foreign('id_rol')->references('id')->on('roles');
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usuarios');
    }
};
