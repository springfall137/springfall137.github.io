$path = "c:\Users\user\Downloads\springfall137.github.io-main\index.html"
$lines = [System.Collections.Generic.List[string]]([System.IO.File]::ReadAllLines($path))

# 1. Remove Duplicate Header (Lines 117-137 approx)
$idx_bad_edu = -1
for ($i=0; $i -lt 200; $i++) {
    if ($lines[$i].Trim() -eq "<h5>Education</h5>") {
        $idx_bad_edu = $i
        break
    }
}
if ($idx_bad_edu -ne -1) {
    # Verify it is the first one (bad one) by checking context or just position
    # The real Education header is usually after Skills.
    # Let's find the second one to be sure.
    $idx_good_edu = -1
    for ($i=$idx_bad_edu+1; $i -lt 300; $i++) {
        if ($lines[$i].Trim() -eq "<h5>Education</h5>") {
            $idx_good_edu = $i
            break
        }
    }
    
    if ($idx_good_edu -ne -1) {
        # Remove from <br><br> before bad header (approx -2) until before good header
        # But we must keep the <div class="col-md-12"> at line ~116
        # Let's simple remove range from $idx_bad_edu - 2 to $idx_bad_edu + 19 (Skills section)
        # Actually, let's remove everything between the first <br><br> before bad header and the good header.
        $start_rem = $idx_bad_edu - 2
        $count = $idx_good_edu - $start_rem
        if ($count -gt 0) {
            $lines.RemoveRange($start_rem, $count)
        }
    }
}

# 2. Find Experience Start
$idx_exp = -1
for ($i=0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "<h3>Experience</h3>") { $idx_exp = $i; break }
}

# 3. Find Awards End
$idx_awards_end = -1
for ($i=$idx_exp; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "<h2>Awards</h2>") { 
        for ($j=$i; $j -lt $lines.Count; $j++) {
            if ($lines[$j] -match "</section>") {
                $idx_awards_end = $j
                break
            }
        }
        break
    }
}

if ($idx_exp -ne -1 -and $idx_awards_end -ne -1) {
    $count = $idx_awards_end - $idx_exp + 1
    $lines.RemoveRange($idx_exp, $count)
    
    $newContent = @"
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
"@
    
    $lines.InsertRange($idx_exp, $newContent -split "`r`n")
}

# 5. Save without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
