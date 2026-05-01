#!/bin/bash
# =============================================================
#  deploy.sh - Script de déploiement rapide
#  Usage: bash deploy.sh "Description de vos changements"
# =============================================================

MSG="${1:-Update $(date '+%Y-%m-%d %H:%M')}"

echo "🚀 Déploiement en cours..."
git add .
git commit -m "$MSG"
git push

echo ""
echo "✅ Déployé ! Vos changements seront visibles sur votre site dans 30-60 secondes."
echo "   → Railway redéploie automatiquement dès que vous poussez sur GitHub."
