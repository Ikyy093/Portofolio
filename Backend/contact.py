from flask import Blueprint, request, jsonify
import resend
from config import Config
import traceback

contact_bp = Blueprint("contact", __name__)

resend.api_key = Config.RESEND_API_KEY

print("API KEY:", Config.RESEND_API_KEY[:10], "...")


@contact_bp.route("/contact", methods=["POST"])
def send_contact():
    try:
        data = request.json

        nama = data.get("nama")
        email = data.get("email")
        pesan = data.get("pesan")

        params = {
            "from": "onboarding@resend.dev",
            "to": ["682024093@student.uksw.edu"],
            "subject": f"Pesan Baru dari {nama}",
            "html": f"""
            <h2>Pesan Baru Website Portfolio</h2>

            <p><b>Nama:</b> {nama}</p>
            <p><b>Email:</b> {email}</p>

            <hr>

            <p>{pesan}</p>
            """
        }

        print("=== PARAMS ===")
        print(params)

        response = resend.Emails.send(params)

        print("=== RESPONSE ===")
        print(response)

        return jsonify({
            "success": True,
            "message": "Pesan berhasil dikirim."
        })

    except Exception as e:
        traceback.print_exc()

        return jsonify({
            "success": False,
            "error": str(e)
        }), 500