$path = "c:\Users\user\Downloads\springfall137.github.io-main\index.html"
$lines = [System.Collections.Generic.List[string]]([System.IO.File]::ReadAllLines($path))

# 1. Update Header Spacing
for ($i=0; $i -lt 150; $i++) {
    if ($lines[$i].Trim() -eq "<h5>Education</h5>") {
        # Check if previous lines have <div class="col-md-12">
        # Look backwards up to 5 lines
        $has_div = $false
        for ($j=1; $j -le 5; $j++) {
            if ($i-$j -ge 0 -and $lines[$i-$j] -match "col-md-12") {
                $has_div = $true
                break
            }
        }
        
        if (-not $has_div) {
            $lines.Insert($i, "<br><br>")
            $lines.Insert($i, "<div class=""col-md-12"">")
        }
        break
    }
}

# 2. Rewrite Exp & Awards
$exp_start = -1
for ($i=0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "<h3>Experience</h3>") { $exp_start = $i; break }
}

$proj_start = -1
for ($i=$exp_start; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "<!-- Projects -->") { 
        # Go back to find the closing divs of the row?
        # The structure we want is:
        # <div class="d-flex flex-row-reverse mt-4"> (View All Projects) is usually BEFORE Projects comment?
        # No, "Recent projects" is AFTER check lines.
        $proj_start = $i 
        break 
    }
}

# If proj_start not found, find "Recent projects"
if ($proj_start -eq -1) {
    for ($i=$exp_start; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "Recent projects") { 
            $proj_start = $i - 2 # Go back before <div class="container"> ?
            break 
        }
    }
}

if ($exp_start -ne -1 -and $proj_start -ne -1) {
    # We need to preserve the closing divs for the main container if we are replacing too much.
    # But let's assume we replace everything from <h3>Experience</h3> until before Projects starts.
    # We need to close the row and container properly.
    
    $count = $proj_start - $exp_start
    if ($count -gt 0) {
        $lines.RemoveRange($exp_start, $count)
    }
    
    $HTML = @"
            <h3>Experience</h3>
            <section id="experience">
                <h5>Research Experience</h5>
                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-flask" style="margin-right: .5rem;"></i>
                            <span><b><a href="https://aisdl.snu.ac.kr">SNU AI-driven Simulation and Design Lab</a></b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Mar. 2025 ~ Present
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>M.S./Ph.D. integrated course regarding metamaterial, AI driven simulation and design<br>
                        (Prof. Do-Nyun Kim)</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-flask" style="margin-right: .5rem;"></i>
                            <span><b>SNU MetaStructure Lab</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Sep. 2024 ~ Jan. 2025
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Undergraduate Intern<br>
                        (Prof. J. H. Oh)<br>
                        waves, metamaterial, acoustic finite element method, AI-driven topology optimization</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-flask" style="margin-right: .5rem;"></i>
                            <span><b>SNU Transformative Architecture Lab</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Oct. 2023 ~ Jan. 2024
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Undergraduate Intern<br>
                        (Prof. J.K. Yang)<br>
                        Simulation for the production of deployable bistable dodecahedral large origami structures. Performed FEA using Abaqus.</medium>
                    </div>
                </div>

                <br>
                <h5>Work Experience</h5>
                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>STATION F</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Feb. 2025
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Intern</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Thales Korea</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Mar. 2024 ~ Jul. 2024
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Intern</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>SNU Gwanak Residence Halls Administrative Office</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Jan. 2024 ~ Feb. 2024
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Working scholarship student</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Youtube channel <a href="https://youtube.com/@biztorang">“@biztorang”</a></b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Jun. 2023 ~ Aug. 2023
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Content Creator</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Fruit online retail sales “DogodoNongwon”</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Apr. 2023 ~ May. 2023
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Sales Manager</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Youtube channel <a href="https://youtube.com/@jjuvoyager">“@jjuvoyager”</a></b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Oct. 2022 ~ Present
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Content Creator</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-person-military-pointing" style="margin-right: .5rem;"></i>
                            <span><b>Republic of Korea Air Force</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Jul. 2021 ~ Apr. 2023
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Sergeant expired<br>
                        15th Special Missions Wing 15th Weather Squadron</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>SNU Department of Physics and Astronomy</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Nov. 2020 ~ Jul. 2021
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>President of Student Council</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Center for Theoretical Physics, SNU</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Mar. 2020 ~ Jun. 2021
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Department of Physics and Astronomy (working scholarship student)</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Emoticon and items brand “jjooda”</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Apr. 2020 ~ Jan. 2021
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Founder</medium>
                    </div>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-briefcase" style="margin-right: .5rem;"></i>
                            <span><b>Rocket pre-startup “Kspace”</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            Dec. 2019 ~ Feb. 2020
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>CFD Engineer (Rocket Injector Design)</medium>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-md-6">
            <h2>Awards</h2>
            <section id="awards">
                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Semiconductor Solverton Competition Top Prize<br>(Deputy Prime Minister and Education Minister Prize)</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2024
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>Optimizing AC performance of GAA NS FET by analyzing and optimizing resistance, capacitance, and frequency gain compered to FinFET through structural modeling and process-driven device design. Proposing a new design with enhanced performance via TCAD</medium>
                    </div><br>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Seoul National University Semiconductor Specialized College Scholarship</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2024
                        </div>
                    </div><br>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Korean History Proficiency Test 1st grade (100/100)</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2022
                        </div>
                    </div>
                    <div class="dated-content" style="font-size: .95rem; font-weight: 300;">
                        <medium>ROKAF Entrepreneurship Contest advance to MND finals</medium>
                    </div><br>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Excellent private granted by ROK Air Force Information Communication School Principal (Col.)</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2021
                        </div>
                    </div><br>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Certificate of completion of「Startup Investment Education」by SNU Entrepreneurship Center</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2020
                        </div>
                    </div><br>
                </div>

                <div class="dated-entry mb-6">
                    <div class="d-flex justify-content-between">
                        <div class="dated-date" style="font-size: 1rem; font-weight: 500;">
                            <i class="fa-solid fa-trophy" style="margin-right: .5rem;"></i>
                            <span><b>Excellent student granted by Chungcheongnam-do Federation of Teachers' Association</b></span>
                        </div>
                        <div class="dated-date" style="font-size: .95rem; font-weight: 300;">
                            2019
                        </div>
                    </div><br>
                </div>
            </section>
        </div>
    </div>
"@
    
    $lines.InsertRange($exp_start, $HTML -split "`r`n")
}

# Save without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
