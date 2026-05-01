# 🚗 MNOJO — Système de Gestion de Lavage Auto

Application Flask pour gérer un centre de lavage automobile avec suivi en temps réel et notifications WhatsApp.

---

## 🌐 Mise en production (étape par étape)

### Étape 1 — GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/VOTRE_NOM/mnojo.git
git branch -M main
git push -u origin main
```

### Étape 2 — Railway (hébergement gratuit)

1. Créez un compte sur [railway.app](https://railway.app)
2. **New Project → Deploy from GitHub repo** → sélectionnez `mnojo`
3. Railway détecte Flask et déploie automatiquement ✓
4. Récupérez votre URL publique : `https://mnojo.up.railway.app`

### Étape 3 — Variables d'environnement sur Railway

Dans Railway → votre projet → **Settings → Variables**, ajoutez :

| Clé | Valeur |
|-----|--------|
| `TWILIO_SID` | Votre Account SID Twilio |
| `TWILIO_TOKEN` | Votre Auth Token Twilio |
| `SITE_URL` | `https://mnojo.up.railway.app` (ou votre domaine .com) |

### Étape 4 — Twilio WhatsApp (messages réels)

1. Créez un compte gratuit sur [twilio.com](https://twilio.com)
2. Activez le **WhatsApp Sandbox** (Messaging → Try it out → Send a WhatsApp message)
3. Le client envoie `join <mot>` au numéro Twilio une seule fois
4. Après ça, vous pouvez lui envoyer des messages automatiquement

> Sans Twilio configuré, l'app génère des liens `wa.me` click-to-chat (mode simulation).

### Étape 5 — Domaine .com (optionnel, ~10$/an)

1. Achetez un domaine sur [namecheap.com](https://namecheap.com)
2. Railway → Settings → **Domains → Add Custom Domain** → entrez votre domaine
3. Namecheap → DNS → ajoutez le CNAME donné par Railway
4. Mettez à jour `SITE_URL` dans Railway avec votre nouveau domaine

---

## 🔄 Déploiement automatique (VS Code → Site en direct)

Chaque modification dans VS Code est visible sur votre site en ~30 secondes :

```bash
# Option 1 : commandes git classiques
git add .
git commit -m "Ma modification"
git push

# Option 2 : script rapide
bash deploy.sh "Description de mes changements"
```

---

## 👥 Comptes par défaut

| Rôle | Identifiant | Mot de passe |
|------|-------------|--------------|
| Admin | `admin` | `admin123` |
| Employé | `admin1` | `1234` |

---

## 🏗️ Structure du projet

```
mnojo/
├── app.py              ← Application Flask principale
├── database.py         ← Initialisation SQLite
├── requirements.txt    ← Dépendances Python
├── Procfile            ← Configuration Gunicorn (Railway)
├── deploy.sh           ← Script de déploiement rapide
├── .env.example        ← Modèle de variables d'environnement
├── .gitignore          ← Fichiers ignorés par Git
├── static/
│   ├── main.js
│   └── style.css
└── templates/
    ├── base.html
    ├── index.html
    ├── admin_dashboard.html
    ├── admin_login.html
    ├── client_login.html
    ├── client_track.html
    ├── employee_dashboard.html
    └── employee_login.html
```

---

## 💻 Lancement en local

```bash
pip install -r requirements.txt
cp .env.example .env   # puis remplissez vos clés
python app.py
# → http://localhost:5000
```

---

## 💬 Fonctionnement WhatsApp

Quand un employé enregistre une voiture, le client reçoit automatiquement :

```
Bonjour ! 🚗 Votre voiture a bien été enregistrée.
Code de suivi : *742*
Suivez l'avancement en temps réel ici :
https://mnojo.com/client/track/742
```

Si `TWILIO_SID` et `TWILIO_TOKEN` sont configurés → **envoi réel via l'API Twilio**.
Sinon → **lien wa.me click-to-chat** (l'employé clique et WhatsApp s'ouvre).
