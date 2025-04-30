
import React, { useState } from 'react'

const SearchBar = ({ reservas, irParaMesa }) => {
  const [termo, setTermo] = useState('')

  const buscar = () => {
    const r = reservas.find(r =>
      r.nome?.toLowerCase().includes(termo.toLowerCase()) ||
      r.telefone?.includes(termo)
    )
    if (r) irParaMesa(r.mesa_numero, r.cadeira_numero)
    else alert('Reserva não encontrada.')
  }

  return (
    <div className="search-bar">
      <input
        placeholder="Buscar por nome ou telefone"
        value={termo}
        onChange={e => setTermo(e.target.value)}
      />
      <button onClick={buscar}>Buscar</button>
    </div>
  )
}

export default SearchBar
