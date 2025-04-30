<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ReservaController;
use App\Http\Middleware\CorsMiddleware;

    Route::middleware([CorsMiddleware::class])->group(function () {
    Route::get('/reservas', [ReservaController::class, 'index']);
    Route::post('/reservas', [ReservaController::class, 'reservar']);
    Route::post('/reservas/checkin', [ReservaController::class, 'checkin']);
    Route::put('/reservas/{id}', [ReservaController::class, 'update']);
    Route::delete('/reservas/{id}', [ReservaController::class, 'destroy']);
});
