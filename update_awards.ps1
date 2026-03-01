$path = "c:\Users\user\Downloads\springfall137.github.io-main\index.html"
$lines = Get-Content $path
# Awards Header is at line 468 (index 467). Section start at 469 (index 468).
# Awards End is at line 768 (index 767).
# We want to keep up to line 469 (index 468)
$head = $lines[0..468]
# We want to keep from line 768 (index 767)
$tail = $lines[767..($lines.Count-1)]

$new = @"
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
                        <medium>Optimizing AC performance of GAA NS FET by analyzing and optimizing resistance, capacitance, and frequency gain compered to FinFET through structural modeling and process-driven device design. Proposing a new design with enhanced performance via TCAD<br>
                        Seoul National University Semiconductor Specialized College Scholarship</medium>
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
"@

$final = $head + $new + $tail
$final | Set-Content $path -Encoding UTF8
