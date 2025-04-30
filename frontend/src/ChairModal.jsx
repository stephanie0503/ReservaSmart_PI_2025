import React from 'react';
import './App.css';

function ChairModal({ data, onClose }) {
  const { mesa, cadeira, reserva } = data;

  return (
    <div className="modal-backdrop">
      <div className="modal">
        <h2>{reserva ? 'Editar Reserva' : 'Nova Reserva'}</h2>
        <p><strong>Mesa:</strong> {mesa}</p>
        <p><strong>Cadeira:</strong> {cadeira}</p>
        {reserva ? (
          <>
            <p><strong>Nome:</strong> {reserva.nome}</p>
            <p><strong>Telefone:</strong> {reserva.telefone}</p>
            {/* Aqui você pode colocar botões para editar ou deletar */}
          </>
        ) : (
          <>
            <p>Esta cadeira está disponível.</p>
            {/* Aqui você pode colocar um formulário para reservar */}
          </>
        )}
        <button onClick={onClose}>Fechar</button>
      </div>
    </div>
  );
}

export default ChairModal;
