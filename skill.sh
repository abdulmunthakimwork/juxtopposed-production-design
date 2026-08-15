#!/bin/bash
set -euo pipefail

# Juxtopposed Production Design Skill - GitHub Deployment Script
# Usage: ./skill.sh [command]
# Commands:
#   install     - Install skill to local .trae/skills directory
#   package     - Create a release package for GitHub
#   validate    - Validate skill structure and metadata
#   help        - Show this help message

SKILL_NAME="juxtopposed-production-design"
SKILL_VERSION=$(grep -m1 'version:' SKILL.md | cut -d'"' -f2 || echo "1.0.0")
SKILL_DIR=".trae/skills/${SKILL_NAME}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() { echo -e "${BLUE}→${NC} $1"; }
success() { echo -e "${GREEN}✓${NC} $1"; }
warn() { echo -e "${YELLOW}⚠${NC} $1"; }
error() { echo -e "${RED}✗${NC} $1"; exit 1; }

validate_skill() {
    log "Validating skill structure..."
    
    # Check SKILL.md exists
    if [[ ! -f "SKILL.md" ]]; then
        error "SKILL.md not found. Are you in the skill root directory?"
    fi
    
    # Validate frontmatter
    local name=$(grep -m1 'name:' SKILL.md | head -1)
    local description=$(grep -m1 'description:' SKILL.md | head -1)
    local version=$(grep -m1 'version:' SKILL.md | head -1)
    
    if [[ -z "$name" ]]; then error "SKILL.md missing 'name' field in frontmatter"; fi
    if [[ -z "$description" ]]; then error "SKILL.md missing 'description' field in frontmatter"; fi
    if [[ -z "$version" ]]; then warn "SKILL.md missing 'version' field in frontmatter (recommended)"; fi
    
    # Validate description format (should include what it does and when to invoke)
    if [[ ! "$description" =~ .*Invoke.*when.* ]]; then
        warn "Description doesn't explicitly state when to invoke (recommended for best results)"
    fi
    
    # Check file sizes
    local skill_size=$(wc -c < SKILL.md)
    if [[ $skill_size -gt 100000 ]]; then
        warn "SKILL.md is quite large ($skill_size bytes), consider splitting if needed"
    fi
    
    success "Skill validation passed! Version: ${SKILL_VERSION}"
}

install_skill() {
    validate_skill
    
    log "Installing ${SKILL_NAME} to ${SKILL_DIR}..."
    
    # Create directory structure
    mkdir -p "${SKILL_DIR}"
    
    # Copy SKILL.md
    cp SKILL.md "${SKILL_DIR}/"
    
    # Copy skill.sh for local updates
    cp skill.sh "${SKILL_DIR}/" 2>/dev/null || true
    
    success "Skill installed successfully to ${SKILL_DIR}/"
    success "The skill will be available in Trae on next restart"
}

package_skill() {
    validate_skill
    
    local package_name="${SKILL_NAME}-v${SKILL_VERSION}.zip"
    log "Creating GitHub release package: ${package_name}"
    
    # Create temporary package directory
    local temp_dir=$(mktemp -d)
    mkdir -p "${temp_dir}/${SKILL_NAME}"
    
    # Copy files
    cp SKILL.md skill.sh README.md LICENSE "${temp_dir}/${SKILL_NAME}/" 2>/dev/null || true
    
    # Create zip
    cd "${temp_dir}" && zip -r "${OLDPWD}/${package_name}" "${SKILL_NAME}" > /dev/null
    cd "${OLDPWD}"
    
    # Cleanup
    rm -rf "${temp_dir}"
    
    success "Package created: ${package_name}"
    success "Size: $(du -h "${package_name}" | cut -f1)"
}

show_help() {
    echo "Juxtopposed Production Design Skill - GitHub Deployment Script"
    echo ""
    echo "Usage: ./skill.sh [command]"
    echo ""
    echo "Commands:"
    echo "  install     - Install skill to local .trae/skills directory"
    echo "  package     - Create a release zip for GitHub releases"
    echo "  validate    - Validate skill structure and metadata"
    echo "  setup-repo   - Initialize git repository and prepare for GitHub push"
    echo "  help        - Show this help message"
    echo ""
    echo "GitHub Setup:"
    echo "  After running './skill.sh setup-repo', create a repository on GitHub"
    echo "  Then run: git push -u origin main"
}

setup_github_repo() {
    validate_skill
    
    if [[ -d ".git" ]]; then
        warn "Git repository already exists"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi
    
    log "Initializing git repository for GitHub..."
    
    # Create essential GitHub files if they don't exist
    if [[ ! -f "README.md" ]]; then
        log "Creating README.md..."
        cat > README.md << 'EOF'
# Juxtopposed Production Design Skill

A comprehensive, production-grade UI/UX design and redesign methodology for AI agents. Extracted from Juxtopposed's visual/structural intelligence with rigorous Figma and design-system standards.

## What it does

Teaches AI agents how to reason through visual hierarchy, layout selection, containerization, and brand identity to produce diverse, context-specific, production-ready interfaces without relying on fixed templates.

## When to invoke

Use when building new UI, redesigning existing interfaces, conducting design audits, or when users ask for production-grade UI/UX work on landing pages, dashboards, portfolios, or applications.

## Installation

```bash
# Clone the repository
git clone https://github.com/[your-username]/juxtopposed.git ~/.trae/skills/juxtopposed-production-design

# Or use the installation script
./skill.sh install
```

## Features

- First-principles design reasoning
- Layout archetype selection system
- Accessibility and WCAG compliance checks
- Self-critique interrogation loop
- Figma and technical execution guidelines
EOF
        success "README.md created"
    fi
    
    if [[ ! -f ".gitignore" ]]; then
        log "Creating .gitignore..."
        cat > .gitignore << 'EOF'
# Dependencies
node_modules/
*.zip
*.tar.gz

# OS files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Local skill installations
.trae/
EOF
        success ".gitignore created"
    fi
    
    if [[ ! -f "LICENSE" ]]; then
        log "Creating MIT LICENSE..."
        current_year=$(date +%Y)
        cat > LICENSE << EOF
MIT License

Copyright (c) ${current_year}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
        success "LICENSE created"
    fi
    
    # Initialize git
    git init
    git add SKILL.md skill.sh README.md .gitignore LICENSE
    git commit -m "Initial commit: Juxtopposed Production Design Skill v${SKILL_VERSION}"
    
    success "Git repository initialized!"
    echo ""
    echo "Next steps to push to GitHub:"
    echo "1. Create a new repository on GitHub (don't initialize with README)"
    echo "2. Run: git remote add origin https://github.com/[YOUR-USERNAME]/juxtopposed.git"
    echo "3. Run: git branch -M main"
    echo "4. Run: git push -u origin main"
}

# Main command handler
case "${1:-help}" in
    install)
        install_skill
        ;;
    package)
        package_skill
        ;;
    validate)
        validate_skill
        ;;
    setup-repo)
        setup_github_repo
        ;;
    help|*)
        show_help
        ;;
esac