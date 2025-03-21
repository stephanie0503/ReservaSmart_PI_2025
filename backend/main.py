
from fastapi import FastAPI
from routes import router

app = FastAPI()

from fastapi.middleware.cors import CORSMiddleware


# Habilita CORS para o frontend acessar a API
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite qualquer origem
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos os métodos (GET, POST, DELETE, etc.)
    allow_headers=["*"],  # Permite todos os cabeçalhos
)

app.include_router(router)

if __name__ == "__main__":
    import uvicorn  # type: ignore
    uvicorn.run(app, host="0.0.0.0", port=8000)   
      