import pickle
from sklearn.linear_model import LinearRegression
import numpy as np

# Datos de ejemplo
X = np.array([[1], [2], [3], [4]])
y = np.array([2, 4, 6, 8])

# Entrenar el modelo
model = LinearRegression()
model.fit(X, y)

# Guardar el modelo en un archivo pickle
with open("model.pkl", "wb") as f:
    pickle.dump(model, f)

print("Modelo entrenado y guardado en model.pkl")
