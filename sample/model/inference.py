import os
import pickle
from flask import Flask, request, jsonify
import numpy as np

app = Flask(__name__)

# Ruta donde SageMaker coloca el modelo descargado
MODEL_DIR = os.getenv("SAGEMAKER_MODEL_DIR", "/opt/ml/model")
MODEL_PATH = os.path.join(MODEL_DIR, "model.pkl")

# Cargar el modelo en el arranque del contenedor
with open(MODEL_PATH, "rb") as f:
    model = pickle.load(f)

@app.route("/invocations", methods=["POST"])
def predict():
    """
    Este endpoint espera un JSON con la siguiente estructura:
    {
      "data": [[valor1], [valor2], ...]
    }
    """
    try:
        input_data = request.get_json()
        # Convertir la entrada a un arreglo numpy
        data = np.array(input_data["data"])
        # Realizar la predicción
        prediction = model.predict(data)
        # Devolver la predicción en formato JSON
        return jsonify({"prediction": prediction.tolist()})
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    # En SageMaker se utiliza Gunicorn, pero para pruebas locales Flask es suficiente
    app.run(host="0.0.0.0", port=8080, debug=True)
