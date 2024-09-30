<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActividadesController;
use App\Http\Controllers\FondosController;
use App\Http\Controllers\PagosController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UsuariosController;
use App\Http\Controllers\CategoriasController;


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/actividades',[ActividadesController::class,'index'])->name('actividades.index');
Route::post('/actividades',[ActividadesController::class,'store'])->name('actividades.store');
Route::delete('/actividades/{actividad}',[ActividadesController::class,'destroy'])->name('actividades.destroy');
Route::get('/actividades/{actividad}',[ActividadesController::class,'show'])->name('actividades.show');
// Route::get('/actividades/{actividad}/edit',[ActividadesController::class,'edit'])->name('generos.edit')->middleware('auth');;
Route::put('/actividades/{actividad}',[ActividadesController::class,'update'])->name('actividades.update');


Route::get('/fondos',[fondosController::class,'index'])->name('fondos.index');
Route::post('/fondos',[fondosController::class,'store'])->name('fondos.store');
Route::delete('/fondos/{fondo}',[fondosController::class,'destroy'])->name('fondos.destroy');
Route::get('/fondos/{fondo}',[fondosController::class,'show'])->name('fondos.show');
// Route::get('/fondos/{actividad1}/edit',[fondosController::class,'edit'])->name('fondos.edit')->middleware('auth');;
Route::put('/fondos/{fondo}',[fondosController::class,'update'])->name('fondos.update');


Route::apiResource('pagos', PagosController::class);


Route::get('/roles',[RolesController::class,'index'])->name('roles.index');
Route::get('/roles/{rol}',[RolesController::class,'show'])->name('roles.show');
Route::post('/roles',[RolesController::class,'store'])->name('roles.store');
Route::delete('/roles/{rol}',[RolesController::class,'destroy'])->name('roles.destroy');
// Route::get('/roles/{rol}/edit',[RolesController::class,'edit'])->name('generos.edit')->middleware('auth');;
Route::put('/roles/{rol}',[RolesController::class,'update'])->name('roles.update');


Route::apiResource('usuarios', UsuariosController::class);
Route::put('usuarios/actualizar-plus/{usuario}', [UsuariosController::class, 'plus']);
Route::put('usuarios/cambiar-contrasena/{usuario}', [UsuariosController::class, 'password']);
Route::post('/login',[UsuariosController::class, 'login']);


Route::apiResource('categorias', CategoriasController::class);


// Route::get('equipos/comienzan-con-a', [EquiposController::class, 'equiposComienzanConA']);
// Route::put('pilotos/cambiarEquipo/{equipo}', [PilotosController::class, 'cambiarEquipo']);
