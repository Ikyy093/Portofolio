from flask import Blueprint, jsonify
from model import Database
import traceback

utama_bp = Blueprint('utama', __name__)


@utama_bp.route('/main-profile', methods=['GET'])
def get_main_profile():
    try:
        db = Database()

        # Ambil profile admin
        profile_query = """
            SELECT p.*
            FROM profiles p
            JOIN users u ON p.user_id = u.id
            WHERE u.role = 'admin'
            LIMIT 1
        """
        profile = db.execute_query(profile_query, fetch=True)

        if not profile:
            return jsonify({
                "success": False,
                "message": "Data profile belum ada."
            }), 404

        profile = profile[0]

        # Ambil skills
        skills_query = """
            SELECT nama_skill, icon_class
            FROM skills
            WHERE user_id = %s
            ORDER BY id DESC
        """
        skills = db.execute_query(
            skills_query,
            (profile["user_id"],),
            fetch=True
        )

        # Ambil experiences
        experience_query = """
            SELECT posisi,
                   perusahaan,
                   durasi,
                   deskripsi
            FROM experiences
            WHERE user_id = %s
            ORDER BY created_at DESC
        """
        experiences = db.execute_query(
            experience_query,
            (profile["user_id"],),
            fetch=True
        )

        # Ambil projects
        project_query = """
            SELECT judul,
                   deskripsi,
                   gambar_url,
                   link_project
            FROM projects
            WHERE user_id = %s
            ORDER BY created_at DESC
        """

        projects = db.execute_query(
            project_query,
            (profile["user_id"],),
            fetch=True
        )

        profile["skills"] = skills
        profile["experiences"] = experiences
        profile["projects"] = projects

        return jsonify({
            "success": True,
            "data": profile
        })
    
    except Exception as e:
        traceback.print_exc()

    return jsonify({
        "success": False,
        "error": str(e)
    }), 500