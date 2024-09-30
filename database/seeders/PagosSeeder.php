<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PagosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pagos')->insert([
            ['id_usuario'=>1,'fecha_compra'=>'2023-11-13 00:00:00'],
            ['id_usuario'=>2,'fecha_compra'=>'2024-4-23 00:00:00'],
            ['id_usuario'=>3,'fecha_compra'=>'2024-3-25 00:00:00'],
            ['id_usuario'=>4,'fecha_compra'=>'2024-4-13 00:00:00'],
            ['id_usuario'=>5,'fecha_compra'=>'2024-5-12 00:00:00'],
            ['id_usuario'=>6,'fecha_compra'=>'2023-10-31 00:00:00'],
            ['id_usuario'=>7,'fecha_compra'=>'2023-9-30 00:00:00'],
        ]);
    }
}
