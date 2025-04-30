<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('reservas', function (Blueprint $table) {
        $table->id();
        $table->integer('mesa_numero');
        $table->integer('cadeira_numero');
        $table->string('nome');
        $table->string('telefone');
        $table->decimal('valor_pago', 8, 2);
        $table->boolean('socio')->default(false);
        $table->date('data_aniversario');
        $table->boolean('checkin')->default(false);
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservas');
    }
};
