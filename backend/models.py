from pydantic import BaseModel
from datetime import date


class Reserva(BaseModel):
    nome: str
    telefone: str
    mesa: int
    lugar: int
    aniversario: str  # A data virá no formato "DD-MM-YYYY"
    valor_pago: float
    socio: bool

    class Config:
        from_attributes = True   # Habilita o mapeamento ORM   

     