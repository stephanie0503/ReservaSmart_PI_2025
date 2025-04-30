<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    protected $fillable = [
        'mesa_numero',
        'cadeira_numero',
        'nome',
        'telefone',
        'valor_pago',
        'socio',
        'data_aniversario',
        'checkin',
    ];
}
