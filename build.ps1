# build.ps1 - Script de compilation pour Windows PowerShell
# Alternative au Makefile pour les utilisateurs Windows

param(
    [string]$Action = "build"
)

# Configuration
$Target = "caisse.exe"
$SrcDir = "src"
$DataDir = "data"
$Sources = @("$SrcDir\main.c", "$SrcDir\menu.c", "$SrcDir\caisse.c", "$SrcDir\utils.c")
$CompilerFlags = "-Wall -Wextra -std=c99 -g"

# Fonction pour afficher des messages colorés
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

# Fonction pour vérifier si gcc est installé
function Test-GccInstalled {
    try {
        $null = Get-Command gcc -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Actions disponibles
switch ($Action.ToLower()) {
    "build" {
        Write-ColorOutput Yellow "🔨 Compilation du projet..."
        
        if (-not (Test-GccInstalled)) {
            Write-ColorOutput Red "❌ Erreur : gcc n'est pas installé ou pas dans le PATH"
            Write-ColorOutput Cyan "💡 Installez MinGW-w64 ou MSYS2 :"
            Write-ColorOutput White "   - MSYS2 : https://www.msys2.org/"
            Write-ColorOutput White "   - Ou utilisez Dev-C++, Code::Blocks"
            exit 1
        }

        # Vérifier que les fichiers source existent
        $missingFiles = @()
        foreach ($file in $Sources) {
            if (-not (Test-Path $file)) {
                $missingFiles += $file
            }
        }
        
        if ($missingFiles.Count -gt 0) {
            Write-ColorOutput Red "❌ Fichiers source manquants :"
            foreach ($file in $missingFiles) {
                Write-ColorOutput Red "   - $file"
            }
            Write-ColorOutput Cyan "💡 Utilisez './build.ps1 setup' pour créer la structure"
            exit 1
        }

        # Compilation
        $cmd = "gcc $CompilerFlags $($Sources -join ' ') -o $Target"
        Write-ColorOutput Gray "Commande : $cmd"
        
        Invoke-Expression $cmd
        
        if ($LASTEXITCODE -eq 0) {
            Write-ColorOutput Green "✅ Compilation réussie ! Exécutable créé : $Target"
        } else {
            Write-ColorOutput Red "❌ Erreur de compilation"
            exit 1
        }
    }
    
    "run" {
        Write-ColorOutput Yellow "🚀 Compilation et exécution..."
        & $PSCommandPath "build"
        if ($LASTEXITCODE -eq 0 -and (Test-Path $Target)) {
            Write-ColorOutput Cyan "Lancement du programme..."
            & ".\$Target"
        }
    }
    
    "clean" {
        Write-ColorOutput Yellow "🧹 Nettoyage des fichiers temporaires..."
        
        # Supprimer les fichiers .o s'ils existent
        Get-ChildItem -Path $SrcDir -Filter "*.o" -ErrorAction SilentlyContinue | Remove-Item -Force
        
        Write-ColorOutput Green "✅ Nettoyage terminé"
    }
    
    "fclean" {
        Write-ColorOutput Yellow "🧹 Nettoyage complet..."
        
        & $PSCommandPath "clean"
        
        if (Test-Path $Target) {
            Remove-Item $Target -Force
            Write-ColorOutput Green "✅ Exécutable supprimé"
        }
    }
    
    "setup" {
        Write-ColorOutput Yellow "📁 Création de la structure de projet..."
        
        # Créer les dossiers
        if (-not (Test-Path $SrcDir)) {
            New-Item -ItemType Directory -Path $SrcDir -Force | Out-Null
            Write-ColorOutput Green "✅ Dossier '$SrcDir' créé"
        }
        
        if (-not (Test-Path $DataDir)) {
            New-Item -ItemType Directory -Path $DataDir -Force | Out-Null
            Write-ColorOutput Green "✅ Dossier '$DataDir' créé"
        }
        
        # Créer le fichier recu.txt s'il n'existe pas
        $recuFile = "$DataDir\recu.txt"
        if (-not (Test-Path $recuFile)) {
            New-Item -ItemType File -Path $recuFile -Force | Out-Null
            Write-ColorOutput Green "✅ Fichier '$recuFile' créé"
        }
        
        # Créer des fichiers .h vides s'ils n'existent pas
        $headers = @("$SrcDir\menu.h", "$SrcDir\caisse.h", "$SrcDir\utils.h")
        foreach ($header in $headers) {
            if (-not (Test-Path $header)) {
                New-Item -ItemType File -Path $header -Force | Out-Null
                Write-ColorOutput Green "✅ Fichier '$header' créé"
            }
        }
        
        Write-ColorOutput Cyan "💡 N'oubliez pas de créer vos fichiers .c dans le dossier src/"
    }
    
    "help" {
        Write-ColorOutput Cyan "📖 Script de compilation pour le projet Caisse Automatique"
        Write-ColorOutput White ""
        Write-ColorOutput White "Usage : .\build.ps1 [action]"
        Write-ColorOutput White ""
        Write-ColorOutput White "Actions disponibles :"
        Write-ColorOutput Green "  build   " -NoNewline; Write-ColorOutput White "- Compile le programme (par défaut)"
        Write-ColorOutput Green "  run     " -NoNewline; Write-ColorOutput White "- Compile et exécute le programme"
        Write-ColorOutput Green "  clean   " -NoNewline; Write-ColorOutput White "- Supprime les fichiers temporaires"
        Write-ColorOutput Green "  fclean  " -NoNewline; Write-ColorOutput White "- Nettoyage complet (+ exécutable)"
        Write-ColorOutput Green "  setup   " -NoNewline; Write-ColorOutput White "- Crée la structure de dossiers"
        Write-ColorOutput Green "  help    " -NoNewline; Write-ColorOutput White "- Affiche cette aide"
        Write-ColorOutput White ""
        Write-ColorOutput Yellow "Exemples :"
        Write-ColorOutput Gray "  .\build.ps1          # Compile"
        Write-ColorOutput Gray "  .\build.ps1 run      # Compile et exécute"
        Write-ColorOutput Gray "  .\build.ps1 setup    # Crée la structure"
    }
    
    default {
        Write-ColorOutput Red "❌ Action inconnue : $Action"
        Write-ColorOutput Cyan "💡 Utilisez '.\build.ps1 help' pour voir les actions disponibles"
        exit 1
    }
}