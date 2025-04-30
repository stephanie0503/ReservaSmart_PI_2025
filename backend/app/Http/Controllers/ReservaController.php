<?php

namespace App\Http\Controllers;

use App\Models\Reserva;
use Illuminate\Http\Request;

class ReservaController extends Controller
{
    // Lista todas as reservas
    public function index()
    {
        return Reserva::all();
    }

    // Verifica se um lugar está reservado
    public function verificar($mesa, $cadeira)
    {
        $reserva = Reserva::where('mesa_numero', $mesa)
                          ->where('cadeira_numero', $cadeira)
                          ->first();
        return response()->json([
            'ocupado' => $reserva ? true : false,
            'reserva' => $reserva
        ]);
    }

    // Faz uma nova reserva
    public function reservar(Request $request)
    {
        $request->validate([
            'mesa_numero' => 'required|integer',
            'cadeira_numero' => 'required|integer',
            'nome' => 'required|string',
            'telefone' => 'required|string',
            'valor_pago' => 'required|numeric',
            'socio' => 'required|boolean',
            'data_aniversario' => 'required|date',
        ]);

        // Verifica se o lugar já está reservado
        if (Reserva::where('mesa_numero', $request->mesa_numero)
            ->where('cadeira_numero', $request->cadeira_numero)
            ->exists()) {
            return response()->json(['erro' => 'Lugar já reservado.'], 400);
        }

        $reserva = Reserva::create($request->all());

        return response()->json($reserva, 201);
    }

    // Check-in
    public function checkin($id)
    {
        $reserva = Reserva::findOrFail($id);
        $reserva->checkin = true;
        $reserva->save();

        return response()->json(['mensagem' => 'Check-in realizado com sucesso.']);
    }
    
    // Atualiza uma reserva existente
public function update(Request $request, $id)
{
    $reserva = Reserva::findOrFail($id);

    $request->validate([
        'mesa_numero' => 'integer',
        'cadeira_numero' => 'integer',
        'nome' => 'string',
        'telefone' => 'string',
        'valor_pago' => 'numeric',
        'socio' => 'boolean',
        'data_aniversario' => 'date',
        'checkin' => 'boolean',
    ]);

    $reserva->update($request->all());

    return response()->json($reserva);
}

// Deleta uma reserva
public function destroy($id)
{
    $reserva = Reserva::findOrFail($id);
    $reserva->delete();

    return response()->json(['mensagem' => 'Reserva removida com sucesso.']);
}

}
