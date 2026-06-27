const token = localStorage.getItem("token");

if (!token) {
    window.location.href = "login.html";
}

async function loadDashboard() {
    try {
        const response = await fetch("/api/dashboard/stats", {
            headers: {
                "Authorization": "Bearer " + token
            }
        });

        const result = await response.json();

        if (!result.success) {
            alert("Gagal mengambil data dashboard");
            return;
        }

        document.getElementById("skillCount").innerText = result.data.skills_count;
        document.getElementById("projectCount").innerText = result.data.projects_count;
        document.getElementById("experienceCount").innerText = result.data.experiences_count;

        document.getElementById("welcomeText").innerText =
            "Selamat Datang, " + result.data.admin_name + " 👋";

    } catch (err) {
        console.log(err);
    }
}

loadDashboard();

const logoutBtn = document.getElementById("logoutBtn");

if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {

        if (confirm("Yakin ingin logout?")) {

            localStorage.removeItem("token");

            window.location.href = "login.html";

        }

    });
}

document.getElementById("logoutBtn").addEventListener("click", () => {
    localStorage.removeItem("token");
    window.location.href = "login.html";
});

document.getElementById("logoutBtn").addEventListener("click", () => {

    if(confirm("Yakin ingin logout?")){

        localStorage.removeItem("token");

        window.location.href = "/admin/login.html";

    }

});