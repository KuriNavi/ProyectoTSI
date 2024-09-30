<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use Illuminate\Http\Request;

class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Rol::orderBy('id')->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rol = new Rol();
        $rol->id = $request->id_rol;
        $rol->nombre_rol = $request->nombre_rol;
        $rol->save();
        return $rol;
    }

    /**
     * Display the specified resource.
     */
    public function show(Rol $rol)
    {
        return $rol;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Rol $rol)
    {
        // $rol->nombre_rol = $request->nombre_rol;
        // $rol->save();
        // return $rol;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Rol $rol)
    {
        // return $rol->delete();
    }
}
