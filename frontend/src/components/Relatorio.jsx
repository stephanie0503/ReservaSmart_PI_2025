import React from 'react'

const Relatorio = ({ reservas }) => {
  const totalReservadas = reservas.length
  const totalCheckin = reservas.filter(r => r.checkin).length
  const totalSocios = reservas.filter(r => r.socio).length
  const totalNaoSocios = totalReservadas - totalSocios

  const totalArrecadado = reservas.reduce((soma, r) => {
    const valor = parseFloat(r.valor_pago)
    return soma + (isNaN(valor) ? 0 : valor)
  }, 0)

  return (
    <div className="relatorio">
      <h2>📋 Relatório Geral</h2>
      <ul>
        <li><strong>Total de lugares reservados:</strong> {totalReservadas}</li>
        <li><strong>Total com check-in:</strong> {totalCheckin}</li>
        <li><strong>Total arrecadado:</strong> R$ {totalArrecadado.toFixed(2)}</li>
        <li><strong>Sócios:</strong> {totalSocios}</li>
        <li><strong>Não sócios:</strong> {totalNaoSocios}</li>
      </ul>
    </div>
  )
}

export default Relatorio
