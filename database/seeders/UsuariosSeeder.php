<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
class UsuariosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('usuarios')->insert([
            ['nombre_usuario'=>'Administrador 1','correo'=>'admin1@gmail.com','password'=>Hash::make('admin1'),'plus'=>true,'id_fondo'=>1,'id_rol'=>1],
            ['nombre_usuario'=>'Katrina','correo'=>'kbutts1@marriott.com','password'=>Hash::make('pG71w'),'plus'=>true,'id_fondo'=>1,'id_rol'=>1],
            ['nombre_usuario'=>'Luella','correo'=>'lrawll2@cornell.edu','password'=>Hash::make('tW017b'),'plus'=>true,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Manon','correo'=>'macuna3@bandcamp.com','password'=>Hash::make('kM018b'),'plus'=>true,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Gabbie','correo'=>'gference4@discuz.net','password'=>Hash::make('aG14Qx3'),'plus'=>true,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Galvan','correo'=>'gphilpott5@mayoclinic.com','password'=>Hash::make('kI514b'),'plus'=>true,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Quinn','correo'=>'qlockitt6@qq.com','password'=>Hash::make('rC00b'),'plus'=>true,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Carr','correo'=>'cmacgille7@myspace.com','password'=>Hash::make('tZ29x7j'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Meredithe','correo'=>'mmckee8@fda.gov','password'=>Hash::make('jE410I'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Ellerey','correo'=>'epetriello9@statefalse','password'=>Hash::make('bZ78'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Teodor','correo'=>'thanleya@ehow.com','password'=>Hash::make('hW10U'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Denver','correo'=>'dhodgenb@tinyurl.com','password'=>Hash::make('hD54DH'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
            ['nombre_usuario'=>'Robby','correo'=>'rraulstonc@barnesandnoble.com','password'=>Hash::make('tP398Bo'),'plus'=>false,'id_fondo'=>1,'id_rol'=>2],
        ]);
    }
}
