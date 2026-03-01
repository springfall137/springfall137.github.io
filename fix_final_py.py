import codecs
import re

path = r'c:\Users\user\Downloads\springfall137.github.io-main\index.html'

with codecs.open(path, 'r', 'utf-8') as f:
    content = f.read()

# 1. Modify R&E Text
content = content.replace("R&E at Informatics Student Group", "R&E at Physics Student Group")

# 2. Rewrite HTML with correct entities and structure
# Define the new content for Experience and Awards
new_html = """
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
                            <span><b>Youtube channel <a href="https://youtube.com/@biztorang">&ldquo;@biztorang&rdquo;</a></b></span>
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
                            <span><b>Fruit online retail sales &ldquo;DogodoNongwon&rdquo;</b></span>
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
                            <span><b>Youtube channel <a href="https://youtube.com/@jjuvoyager">&ldquo;@jjuvoyager&rdquo;</a></b></span>
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
                            <span><b>Emoticon and items brand &ldquo;jjooda&rdquo;</b></span>
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
                            <span><b>Rocket pre-startup &ldquo;Kspace&rdquo;</b></span>
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
                            <span><b>Certificate of completion of &#12300;Startup Investment Education&#12301; by SNU Entrepreneurship Center</b></span>
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
        </div> <!-- Close Awards col-md-6 -->
    </div> <!-- Close row (Must exist!) -->
"""

# Find Start of Experience
# We know `<h3>Experience</h3>` is the marker.
# We also know `<!-- Projects -->` or `<div class="container py-4">` (Publications) before Projects...
# Wait, Projects is AFTER Experience.
# We need to find the range.
# Start: "<h3>Experience</h3>" line index
# End: A line that contains "<!-- Projects -->" or "Contact Information" or "<div class=\"project-view\">" ?

# Let's use regex for robust matching.
# Match everything from <h3>Experience</h3> until just before the first closing </div> that closes the ROW.
# The structure is:
# <div class="row"> (around line 218)
#   <div class="col-md-6"> (around line 219)
#     <h3>Experience</h3>
#     ...
#   </div>
#   <div class="col-md-6">
#     <h2>Awards</h2>
#     ...
#   </div>
# </div>

# We will replace from `<h3>Experience</h3>` up to the closing `</div>` of the `row`.
# But matching balanced divs with Regex is hard.
# Instead, we will rely on finding the next section marker which is `<!-- Projects -->` or End of File structure.
# But there is no explicit `<!-- Projects -->` comment in the file maybe?
# Let's check the file content dump again.
# 209: <div class="container py-4"> ... publications ... </div>
# 217: <div class="container">
# 218:     <div class="row">
# 219:         <div class="col-md-6">
# 220:             <h3>Experience</h3>

# So we need to replace everything starting from `<h3>Experience</h3>`.
# And we need to find where to STOP.
# The file likely has a `Recent projects` section later? or Contact?
# Let's look for `<!-- Projects -->` if it exists, or `<div class="archive">`?

# Let's search for "Recent projects" text?
# Better: Just locate line 220 and blindly replace until we see something that looks like the start of the next section.
# The next section usually starts with `<div class="container py-4">`?? No.
# Let's look for "Project" word.

start_marker = "<h3>Experience</h3>"
end_marker = "<!-- Projects -->"

start_pos = content.find(start_marker)
if start_pos == -1:
    print("Cannot find Experience Start")
    exit(1)

# Try to find End Marker
end_pos = content.find(end_marker, start_pos)

if end_pos == -1:
    # Fallback: Look for "Contact Information"
    end_contact = content.find("Contact Information", start_pos)
    if end_contact != -1:
        # Backtrack to find closing divs?
        # Typically before Contact, there is closing of main container.
        end_pos = end_contact
        # This is risky.
        # Let's try to match the exact successful content from before.
        # Before my broken edit, there was `<!-- Projects -->` ?
        # Actually I never checked if `<!-- Projects -->` exists.
        pass

# If we can't find a good end marker, let's use the line count logic from before?
# Or just use the fact that we know the structure.
# Let's just strip everything from `<h3>Experience</h3>` to `    </div>\n</div>` (closing row and container)?
# But we need to be careful not to strip too much.

# Alternative: Replace the content between `<h3>Experience</h3>` and `<div class="col-md-12">` (if projects start with that)?
# Let's try to find "Recent projects"
recent_proj = content.find("Recent projects")

if recent_proj != -1:
    # Go back to find the closing div of the PREVIOUS section.
    # The previous section is Experience/Awards.
    # It ends with `</div>` (row) and `</div>` (container).
    # We want to replace everything from `<h3>Experience</h3>` up to the `row` closing div.
    # So we need to KEEP the `container` closing div? No, we are inside `col-md-6`.
    
    # We are replacing:
    #             <h3>Experience</h3>
    #             ...
    #         </div> <!-- col-md-6 -->
    #         <div class="col-md-6">
    #             <h2>Awards</h2>
    #             ...
    #         </div> <!-- col-md-6 -->
    #     </div> <!-- row -->

    # So we should be replacing up to the `</div>` that closes the row. 
    # But finding that specific `</div>` is hard.
    
    # Simpler approach:
    # 1. Split content by lines.
    # 2. Find line with `<h3>Experience</h3>`.
    # 3. Find line with `Recent projects`.
    # 4. Replace lines between [Start, End - Offset].
    pass
else:
    # Maybe "Contact Information"?
    pass

lines = content.splitlines()
idx_start = -1
idx_end = -1

for i, line in enumerate(lines):
    if "<h3>Experience</h3>" in line:
        idx_start = i
        break

for i in range(idx_start, len(lines)):
    if "Recent projects" in line: # Or whatever marker for next section
        idx_end = i
        break
    if "Contact Information" in lines[i]:
        idx_end = i
        break

# Logic: "Recent projects" or "Contact Information" are usually inside a new container or a new row.
# We want to replace the content of the PREVIOUS row.
# The previous row usually ends a few lines before.
# Let's assume idx_end is found. We need to go back to find where the `Experience` row ends.
# But since we are providing the closing `</div>` for the row in `new_html`, we can just cut out everything until the start of the next section's container?
# Wait, `new_html` has `</div> <!-- row -->`.
# So we should remove everything up to the `</div>` that closes the container?
# Structure:
# <div class="container">
#     <div class="row">
#         <div class="col-md-6">
#             SECTION WE REPLACE
#     </div>
# </div>

# If `idx_end` points to "Recent projects", that is likely insde another container/row.
# So we can remove lines from `idx_start` up to `idx_end - X`.
# This is too risky without seeing the file.

# SAFE BET:
# Read the file between `<h3>Experience</h3>` and `end_pos` (start of next major section).
# Then just replace it.
# We will use Regex to find the block.
# We will assume that `new_html` includes valid closing tags for the row.
# We need to make sure we don't accidentally leave an extra `</div>` or remove one too many.

# Let's just use Python to find `<h3>Experience</h3>` and the next `id="projects"` or similar.
# If I look at `view_file` again (Step 870), I don't see ID="projects".
# But I see line 209: `<div class="container py-4">` (Publications).
# line 217: `<div class="container">` (Experience)

# If I can't be sure about the end, I will look for `Contact Information` and go back.
# Contact is usually at the bottom.
# "Recent projects" at line ~600?

# Let's use a very specific string that we know exists in the current bad file to anchor the end.
# The last entry of Awards in the BAD file.
# "Excellent student granted by Chungcheongnam-do"
# "2019"
# Then closing divs.

end_anchor = "Excellent student granted by Chungcheongnam-do"
end_pos = content.find(end_anchor)

# This is risky if I can't find it.
# But I know "2019" is there.

# Let's try `Select-String` logic in Python.
pass

# Final Logic:
# 1. Find `<h3>Experience</h3>`.
# 2. Find `Recent projects` or `Contact Information`.
# 3. Replace the text in between with `new_html`.
#    BUT, `new_html` includes `</div></div>`. We need to match the indentation and structure.
#    Since we are not sure exactly how many div closings are between "End of Awards Content" and "Start of Next Section",
#    Replacing *everything* in between might delete the closing `</div>` of the `container` if we are not careful.
   
#    Structure:
#    <div class="container">
#       <div class="row">
#          <div class="col-md-6">
#             <h3>Experience</h3>
#             ... THIS IS WHAT WE REPLACE ...
#          </div>
#          <div class="col-md-6">
#             ...
#          </div>
#       </div>
#    </div>

#    We want to replace from `<h3>Experience</h3>` ... to the `</div>` that closes the row?
#    Actually, we want to replace from `<h3>Experience</h3>` ... to the end of Awards content.
#    And ensure we emit valid HTML.

#    Let's Regex match: `<h3>Experience</h3>(.*?)<div class="container` (Start of next container).
#    Use DOTALL.
match = re.search(r'(<h3>Experience</h3>.*?)<div class="container', content, re.DOTALL)
if match:
    # Found the block including Exp and Awards until the start of next container.
    # But wait, next container might be `Contact`.
    # Is there a container between Awards and Contact? Projects?
    pass

# Simplified Plan:
# Use `replace_file_content` but with a huge block? No, `multi_replace`?
# No, just overwrite the string in Python.
# Locate `<h3>Experience</h3>`.
# Locate `Recent projects` (if exists).

idx_start = content.find("<h3>Experience</h3>")
idx_next_section = content.find("Recent projects")
if idx_next_section == -1:
    idx_next_section = content.find("Contact Information")

# Inspect content around `idx_next_section` to see closing divs.
# We will define the end point as "Start of Next Section's Container".
# Find the last `</div>` before `idx_next_section`.
# This is becoming complicated.

# Let's use the provided `new_html` which ends with `</div> <!-- Close row -->`.
# We need to find where the current row ends.
# Current file has:
#    <div class="col-md-6">
#        <h2>Awards</h2>
#        ...
#    </div>
# </div> <!-- row -->
# </div> <!-- container --> (maybe)

# If we search for `<h2>Awards</h2>` and find the end of that section...
# Let's just find `<h3>Experience</h3>` and replace EVERYTHING until strictly before `<div class="container"` (Start of Project/Contact).
# AND, we need to make sure we close the `row` and `container`.
# `new_html` closes the `row`. It does NOT close the `container`.
# So we need to make sure we leave one `</div>` before the next container.

if idx_start != -1 and idx_next_section != -1:
    # Find the nearest `<div class="container"` or `<section` before idx_next_section?
    # Actually, "Recent projects" is just text inside some div.
    # Try to find `<div class="container"` before `Recent projects`.
    last_container = content.rfind('<div class="container', 0, idx_next_section)
    if last_container > idx_start:
        # This implies there is a container start AFTER Experience start but BEFORE Projects.
        # That would be weird if Experience and Awards are in one container.
        # Unless "Recent projects" is in a new container.
        # Yes, standard layout: each section in a container.
        
        # So we replace from `<h3>Experience</h3>` up to `last_container`.
        # And we need to close the current container.
        # `new_html` ends with `</div> <!-- Close row (Must exist!) -->`.
        # So we append `</div> <!-- Close container -->` to `new_html`?
        # Let's check line 217 `<div class="container">`.
        # So yes, we need one more div close.
        
        new_html += "\n</div>" # Close container
        
        # Now replace content[idx_start : last_container] with new_html.
        content = content[:idx_start] + new_html + "\n\n\n" + content[last_container:]
        
        with codecs.open(path, 'w', 'utf-8') as f:
            f.write(content)
        print("Success")
    else:
        print("Could not find next container")

"""
