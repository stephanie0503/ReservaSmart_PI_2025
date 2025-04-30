import { useEffect, useState } from "react";
import axios from "axios";
import "./ModalReserva.css";

const ModalReserva = ({ mesa, cadeira, fechar, atualizar }) => {
  const [form, setForm] = useState({
    nome: '',
    telefone: '',
    valor_pago: '',
    socio: false,
    data_aniversario: '',
    checkin: false
  });
  const [reservaExistente, setReservaExistente] = useState(null);

  useEffect(() => {
    axios.get(`http://127.0.0.1:8000/api/reservas`)
      .then(res => {
        const r = res.data.find(
          r => r.mesa_numero === mesa && r.cadeira_numero === cadeira
        );
        if (r) {
          setForm(r);
          setReservaExistente(r);
        }
      });
  }, [mesa, cadeira]);

  const handleChange = e => {
    const { name, value, type, checked } = e.target;
    setForm({ ...form, [name]: type === 'checkbox' ? checked : value });
  };

  const salvar = () => {
    if (reservaExistente) {
      axios.put(`http://127.0.0.1:8000/api/reservas/${reservaExistente.id}`, form)
        .then(() => {
          atualizar();
          fechar();
        });
    } else {
      axios.post(`http://127.0.0.1:8000/api/reservas`, {
        mesa_numero: mesa,
        cadeira_numero: cadeira,
        ...form
      }).then(() => {
        atualizar();
        fechar();
      });
    }
  };

  const alternarCheckin = () => {
    if (!reservaExistente) return;

    const novoEstado = !form.checkin;

    axios.put(`http://127.0.0.1:8000/api/reservas/${reservaExistente.id}`, {
      ...form,
      checkin: novoEstado
    }).then(() => {
      setForm(prev => ({ ...prev, checkin: novoEstado }));
      atualizar();
    });
  };

  const cancelar = () => {
    if (!reservaExistente) return;

    axios.delete(`http://127.0.0.1:8000/api/reservas/${reservaExistente.id}`)
      .then(() => {
        atualizar();
        fechar();
      });
  };

  return (
    <div className="modal">
      <div className="modal-content">
        <h2>Mesa {mesa} - Cadeira {cadeira}</h2>
        <input name="nome" placeholder="Nome" value={form.nome} onChange={handleChange} />
        <input name="telefone" placeholder="Telefone" value={form.telefone} onChange={handleChange} />
        <input name="valor_pago" placeholder="Valor Pago" value={form.valor_pago} onChange={handleChange} />
        <label>
          <input type="checkbox" name="socio" checked={form.socio} onChange={handleChange} />
          Sócio
        </label>
        <input name="data_aniversario" placeholder="Data de Nascimento" value={form.data_aniversario} onChange={handleChange} />

        <div className="botoes">
          <button onClick={salvar}>Salvar</button>

          {reservaExistente && (
            <>
              <button onClick={cancelar}>Cancelar Reserva</button>
              <button onClick={alternarCheckin}>
                {form.checkin ? 'Desfazer Check-in' : 'Fazer Check-in'}
              </button>
            </>
          )}

          <button onClick={fechar}>Fechar</button>
        </div>
      </div>
    </div>
  );
};

export default ModalReserva;
