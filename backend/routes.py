from fastapi import APIRouter, HTTPException
from database import connect_db
from models import Reserva
from datetime import datetime

router = APIRouter()

@router.post("/reservar")
def criar_reserva(reserva: Reserva):
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT 1 FROM reservas WHERE mesa = ? AND lugar = ?", (reserva.mesa, reserva.lugar))
        if cursor.fetchone():
            raise HTTPException(status_code=400, detail="Lugar já ocupado.")

        cursor.execute("""
            INSERT INTO reservas (nome, telefone, mesa, lugar, aniversario, valor_pago, socio, checkin) 
            VALUES (?, ?, ?, ?, ?, ?, ?, 0)
        """, (reserva.nome, reserva.telefone, reserva.mesa, reserva.lugar, reserva.aniversario, reserva.valor_pago, reserva.socio))

        conn.commit()
        return {"message": "Reserva criada com sucesso!"}
    
    finally:
        conn.close()

@router.put("/editar_reserva")
def editar_reserva(reserva: Reserva):
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT 1 FROM reservas WHERE mesa = ? AND lugar = ?", (reserva.mesa, reserva.lugar))
        if not cursor.fetchone():
            raise HTTPException(status_code=404, detail="Reserva não encontrada.")

        cursor.execute("""
            UPDATE reservas 
            SET nome = ?, telefone = ?, aniversario = ?, valor_pago = ?, socio = ? 
            WHERE mesa = ? AND lugar = ?
        """, (reserva.nome, reserva.telefone, reserva.aniversario, reserva.valor_pago, reserva.socio, reserva.mesa, reserva.lugar))

        conn.commit()
        return {"message": "Reserva atualizada com sucesso!"}
    
    finally:
        conn.close()

@router.get("/reservas")
def listar_reservas():
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT nome, telefone, mesa, lugar, aniversario, valor_pago, socio, checkin FROM reservas")
        reservas = cursor.fetchall()

        return [
            {
                "nome": r[0],
                "telefone": r[1],
                "mesa": r[2],
                "lugar": r[3],
                "aniversario": datetime.strptime(r[4], "%Y-%m-%d").strftime("%d-%m-%Y") if r[4] else None,
                "valor_pago": r[5],
                "socio": bool(r[6]),
                "checkin": bool(r[7])
            }
            for r in reservas
        ]
    
    finally:
        conn.close()

@router.delete("/cancelar/{mesa}/{lugar}")
def cancelar_reserva(mesa: int, lugar: int):
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("DELETE FROM reservas WHERE mesa = ? AND lugar = ?", (mesa, lugar))
        conn.commit()
        return {"message": "Reserva cancelada com sucesso!"}
    
    finally:
        conn.close()

@router.get("/status")
def status_mesas():
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT mesa, lugar, nome, telefone, checkin FROM reservas")
        ocupados = cursor.fetchall()

        return {
            "ocupados": [
                {
                    "mesa": row[0], 
                    "lugar": row[1], 
                    "nome": row[2] if row[2] else "Desconhecido",
                    "telefone": row[3] if row[3] else "Não informado",
                    "checkin": bool(row[4])
                }
                for row in ocupados
            ]
        }
    
    finally:
        conn.close()

@router.get("/reservas/{mesa}/{lugar}")
def buscar_reserva(mesa: int, lugar: int):
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            SELECT nome, telefone, aniversario, valor_pago, socio, checkin 
            FROM reservas 
            WHERE mesa = ? AND lugar = ?
        """, (mesa, lugar))
        reserva = cursor.fetchone()

        if reserva:
            return {
                "nome": reserva[0],
                "telefone": reserva[1],
                "aniversario": datetime.strptime(reserva[2], "%Y-%m-%d").strftime("%d-%m-%Y") if reserva[2] else None,
                "valor_pago": reserva[3],
                "socio": bool(reserva[4]),
                "checkin": bool(reserva[5])
            }
        else:
            raise HTTPException(status_code=404, detail="Reserva não encontrada")
    
    finally:
        conn.close()

@router.put("/checkin/{mesa}/{lugar}")
def fazer_checkin(mesa: int, lugar: int):
    conn = connect_db()
    cursor = conn.cursor()

    try:
        cursor.execute("UPDATE reservas SET checkin = 1 WHERE mesa = ? AND lugar = ?", (mesa, lugar))
        conn.commit()
        return {"message": "Check-in realizado com sucesso!"}
    
    finally:
        conn.close()
