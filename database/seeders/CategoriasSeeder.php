<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('categorias')->insert([
            ['nombre_categoria'=>'Categoria 1','color'=>'fcfbeb'],
            ['nombre_categoria'=>'Categoria 2','color'=>'94c889'],
            ['nombre_categoria'=>'Categoria 3','color'=>'7c71b3'],
            ['nombre_categoria'=>'Categoria 4','color'=>'4fa405'],
            ['nombre_categoria'=>'Categoria 5','color'=>'9d515c'],
        ]);
    }
}
    
