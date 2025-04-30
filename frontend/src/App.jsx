import React, { useEffect, useState, useRef } from 'react'
import axios from 'axios'
import ModalReserva from './components/ModalReserva'
import SearchBar from './components/SearchBar'
import Relatorio from './components/Relatorio'
import './index.css'

const mesasConfig = {
  8: [3, 6, 9, 12, 15, 18, 20, 21, 23, 25, 26, 27, 28, 30, 31, 33, 36, 37, 38, 39, 47, 49, 51, 53, 55, 57, 59],
  4: [4, 7, 10, 13, 16, 19, 22, 24, 29, 34, 35, 42, 43, 44, 45, 46, 48, 50, 52, 54, 56, 58, 60],
  6: [1, 2, 5, 8, 11, 14, 17, 40, 41, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71]
}

const gerarMesas = () => {
  const todas = []
  for (const [lugares, numeros] of Object.entries(mesasConfig)) {
    numeros.forEach(num => {
      const qtd = parseInt(lugares)
      for (let i = 1; i <= qtd; i++) {
        todas.push({ mesa_numero: num, cadeira_numero: i })
      }
    })
  }
  return todas
}

const App = () => {
  const [reservas, setReservas] = useState([])
  const [mesaSelecionada, setMesaSelecionada] = useState(null)
  const [cadeiraSelecionada, setCadeiraSelecionada] = useState(null)
  const [showModal, setShowModal] = useState(false)
  const mesaRefs = useRef({})

  useEffect(() => {
    buscarReservas()
  }, [])

  const buscarReservas = () => {
    axios.get('http://127.0.0.1:8000/api/reservas')
      .then(res => setReservas(res.data))
      .catch(err => console.error('Erro ao buscar reservas:', err))
  }

  const abrirModal = (mesa, cadeira) => {
    setMesaSelecionada(mesa)
    setCadeiraSelecionada(cadeira)
    setShowModal(true)
  }

  const fecharModal = () => {
    setShowModal(false)
    setMesaSelecionada(null)
    setCadeiraSelecionada(null)
  }

  const reservaPorLugar = (mesa, cadeira) => {
    return reservas.find(r => r.mesa_numero === mesa && r.cadeira_numero === cadeira)
  }

  const irParaMesa = (mesa, cadeira) => {
    const ref = mesaRefs.current[mesa]
    if (ref) {
      ref.scrollIntoView({ behavior: 'smooth', block: 'center' })
      abrirModal(mesa, cadeira)
    }
  }

  const todasAsMesas = gerarMesas()

  return (
    <div className="container">
      <h1>Reserva de Mesas CTG</h1>

      {/* Relatório de reservas */}
      <Relatorio reservas={reservas} />

      {/* Barra de busca */}
      <SearchBar reservas={reservas} irParaMesa={irParaMesa} />

      {/* Renderização das mesas */}
      <div className="mesas">
        {Object.entries(mesasConfig).map(([lugares, numeros]) => (
          numeros.map(mesa => (
            <div className="mesa" key={mesa} ref={el => mesaRefs.current[mesa] = el}>
              <h3>Mesa {mesa} ({lugares} lugares)</h3>
              <div className="cadeiras">
                {Array.from({ length: parseInt(lugares) }).map((_, i) => {
                  const cadeira = i + 1
                  const r = reservaPorLugar(mesa, cadeira)
                  let classe = 'disponivel'
                  if (r) classe = r.checkin ? 'checkin' : 'reservado'

                  return (
                    <div
                      key={cadeira}
                      className={`cadeira ${classe}`}
                      onClick={() => abrirModal(mesa, cadeira)}
                    >
                      {r ? r.nome : cadeira}
                    </div>
                  )
                })}
              </div>
            </div>
          ))
        ))}
      </div>

      {/* Modal de reserva */}
      {showModal && (
        <ModalReserva
          mesa={mesaSelecionada}
          cadeira={cadeiraSelecionada}
          fechar={fecharModal}
          atualizar={buscarReservas}
        />
      )}
    </div>
  )
}

export default App

