# AI实时语音项目 - Skills自动安装脚本
# 适用于Windows PowerShell

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "     AI Real-time Voice Project - Skills Installation     " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 检查npx是否可用
Write-Host "🔍 检查环境..." -ForegroundColor Yellow
try {
    $npxVersion = npx --version
    Write-Host "✅ npx 版本: $npxVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 未检测到npx，请先安装Node.js" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📦 即将安装的Skills列表:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

$skills = @(
    @{Name="dotneet/claude-code-marketplace@typescript-react-reviewer"; Desc="TypeScript React Code Review"},
    @{Name="softaworks/agent-toolkit@react-dev"; Desc="React Development Toolkit"},
    @{Name="mindrally/skills@nextjs-react-typescript"; Desc="Next.js + React + TypeScript Best Practices"},
    @{Name="mindrally/skills@fastapi-python"; Desc="FastAPI Python Development (7.5K installs) STAR"},
    @{Name="fastapi/fastapi@fastapi"; Desc="FastAPI Official Skill Package"},
    @{Name="aj-geddes/useful-ai-prompts@rest-api-design"; Desc="REST API Design Standards"},
    @{Name="wispbit-ai/skills@python-expert-best-practices-code-review"; Desc="Python Code Review Best Practices"},
    @{Name="jackjin1997/clawforge@clean-code-zh"; Desc="Clean Code Standards (Chinese)"},
    @{Name="bmad-labs/skills@typescript-unit-testing"; Desc="TypeScript Unit Testing"}
)

for ($i = 0; $i -lt $skills.Count; $i++) {
    $skill = $skills[$i]
    Write-Host "$($i+1). $($skill.Name)" -ForegroundColor White
    Write-Host "   └─ $($skill.Desc)" -ForegroundColor DarkGray
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

# Ask user to confirm
$confirm = Read-Host "Continue installation? (y/n)"
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "Installation cancelled" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "🚀 开始安装Skills..." -ForegroundColor Green
Write-Host ""

$successCount = 0
$failCount = 0
$totalCount = $skills.Count

foreach ($skill in $skills) {
    $skillName = $skill.Name
    Write-Host "📥 正在安装: $skillName" -ForegroundColor Cyan
    
    try {
        # 执行安装命令
        $output = npx skills add $skillName -g -y 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ 安装成功: $skillName" -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "❌ 安装失败: $skillName" -ForegroundColor Red
            $failCount++
        }
    } catch {
        Write-Host "❌ 安装异常: $skillName - $($_.Exception.Message)" -ForegroundColor Red
        $failCount++
    }
    
    # 短暂延迟，避免请求过快
    Start-Sleep -Seconds 2
    Write-Host ""
}

# 安装总结
Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "                  Installation Summary                    " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "总计: $totalCount 个Skills" -ForegroundColor White
Write-Host "✅ 成功: $successCount" -ForegroundColor Green
Write-Host "❌ 失败: $failCount" -ForegroundColor $(if ($failCount -eq 0) { "Green" } else { "Red" })
Write-Host ""

if ($failCount -eq 0) {
    Write-Host "All Skills installed successfully!" -ForegroundColor Green
} else {
    Write-Host "Some Skills failed. Please check network or install manually" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Useful Commands:" -ForegroundColor Cyan
Write-Host "----------------------------------------------------------" -ForegroundColor Gray
Write-Host "List installed Skills:  npx skills list" -ForegroundColor White
Write-Host "Check for updates:      npx skills check" -ForegroundColor White
Write-Host "Update all Skills:      npx skills update" -ForegroundColor White
Write-Host "Search new Skills:      npx skills find <keyword>" -ForegroundColor White
Write-Host "----------------------------------------------------------" -ForegroundColor Gray
Write-Host ""

Write-Host "For details, see: SKILLS_RECOMMENDATION.md" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor DarkGray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
