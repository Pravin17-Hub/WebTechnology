<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">

<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Saveetha Universityc:\Users\Dell\Downloads\university_course_analysis_xpath\logo.png</title>

<style>
*{box-sizing:border-box}
body{margin:0;font-family:Arial,Helvetica,sans-serif;background:#f4f7fb;color:#172033}
.header{background:linear-gradient(135deg,#071d49,#1555b5);color:white;padding:22px 6%}
.header-inner{max-width:1250px;margin:auto;display:flex;justify-content:space-between;align-items:center;gap:20px}
.college h1{margin:0;font-size:28px}.college p{margin:7px 0 0;color:#dbeafe;font-size:14px}
.logo{width:76px;height:76px;object-fit:contain;background:white;border-radius:12px;padding:7px}
.container{width:88%;max-width:1250px;margin:30px auto}
.title h2{margin:0;font-size:25px}.title p{color:#64748b;margin-top:6px}
.explorer,.section,.card{background:white;border:1px solid #e3e8f0;box-shadow:0 5px 20px rgba(15,23,42,.06)}
.explorer{border-radius:16px;padding:25px;margin:25px 0}
.explorer-head,.section-header{display:flex;justify-content:space-between;align-items:center;gap:15px}
.explorer-head h3,.section-header h2{margin:0;font-size:21px}
.tag{background:#e8f1ff;color:#1456b8;padding:7px 12px;border-radius:20px;font-size:12px;font-weight:bold}
label{display:block;font-weight:bold;font-size:13px;margin:20px 0 8px;color:#475569}
select{width:100%;padding:13px;border:1px solid #cbd5e1;border-radius:9px;background:white;font-size:14px}
.xpath-box{margin-top:18px;background:#0f172a;color:#dbeafe;border-radius:9px;padding:15px;font-family:Consolas,monospace;font-size:13px;overflow-x:auto}
.button{margin-top:15px;border:0;border-radius:9px;padding:12px 18px;background:#1764d1;color:white;font-weight:bold;cursor:pointer}
.button:hover{background:#0f4eaa}
.result{margin-top:20px;padding:18px;background:#f8fafc;border:1px solid #e2e8f0;border-radius:10px}
.result-title{font-weight:bold;margin-bottom:12px;color:#0f3d91}
.query-result{display:none}.query-result.active{display:block}
.result-item{padding:11px 0;border-bottom:1px solid #e2e8f0;font-size:14px}
.result-item:last-child{border-bottom:0}
.code{color:#1764d1;font-weight:bold}
.cards{display:grid;grid-template-columns:repeat(4,1fr);gap:18px;margin:25px 0}
.card{border-radius:14px;padding:20px}.label{font-size:12px;color:#64748b;font-weight:bold;text-transform:uppercase}.value{font-size:29px;color:#0f3d91;font-weight:bold;margin-top:8px}
.section{border-radius:16px;padding:25px}.table-wrap{overflow-x:auto}table{width:100%;border-collapse:collapse;min-width:780px}
th{background:#eef3f8;padding:14px;text-align:left;font-size:13px}td{padding:15px 14px;border-bottom:1px solid #e5eaf0;font-size:14px}
.student{font-weight:bold}.type{background:#e8f8f0;color:#087443;padding:6px 11px;border-radius:20px;font-size:12px;font-weight:bold}
footer{text-align:center;padding:28px;color:#64748b;font-size:12px}
@media(max-width:850px){.cards{grid-template-columns:repeat(2,1fr)}}
@media(max-width:550px){.cards{grid-template-columns:1fr}.college h1{font-size:20px}.logo{width:60px;height:60px}.explorer-head,.section-header{align-items:flex-start;flex-direction:column}}
</style>
</head>

<body>

<div class="header">
<div class="header-inner">
<div class="college">
<h1>Saveetha Institute of Medical and Technical Sciences</h1>
<p>Academic Course Enrollment Analysis</p>
</div>
<img class="logo" src="logo.png" alt="College Logo"/>
</div>
</div>

<div class="container">

<div class="title">
<h2>Semester Course Overview</h2>
<p>Interactive XPath selection and XSLT course analysis</p>
</div>

<div class="explorer">
<div class="explorer-head">
<h3>XPath Query Explorer</h3>
<span class="tag">Question 2</span>
</div>

<label for="querySelect">Choose an XPath query</label>

<select id="querySelect">

<option value="q1" data-xpath="/courses/course">1. All course records</option>
<option value="q2" data-xpath="/courses/course/name">2. Names of all courses</option>
<option value="q3" data-xpath="/courses/course[students &gt; 50]">3. Courses having more than 50 students</option>
<option value="q4" data-xpath="/courses/course[credits = 4]">4. Courses carrying 4 credits</option>
<option value="q5" data-xpath="/courses/course[type = 'Theory']">5. Courses whose type is Theory</option>
<option value="q6" data-xpath="/courses/course[type = 'Theory' and students &gt; 50]/name">6. Theory course names having more than 50 students</option>
<option value="q7" data-xpath="/courses/course[credits &gt;= 4]/faculty">7. Faculty handling courses with at least 4 credits</option>
<option value="q8" data-xpath="/courses/course[@id = 'C104']">8. Course whose id is C104</option>
<option value="q9" data-xpath="/courses/course[1]">9. First course available</option>
<option value="q10" data-xpath="/courses/course[last()]">10. Last course available</option>

</select>

<div class="xpath-box" id="xpathDisplay"></div>

<button type="button" class="button" id="showResult">Show Result</button>

<div class="result">
<div class="result-title">Extracted Result</div>

<div id="q1" class="query-result active">
<xsl:for-each select="/courses/course">
<div class="result-item"><span class="code"><xsl:value-of select="@id"/></span> — <xsl:value-of select="code"/> — <xsl:value-of select="name"/> — <xsl:value-of select="students"/> students</div>
</xsl:for-each>
</div>

<div id="q2" class="query-result">
<xsl:for-each select="/courses/course/name">
<div class="result-item"><xsl:value-of select="."/></div>
</xsl:for-each>
</div>

<div id="q3" class="query-result">
<xsl:for-each select="/courses/course[students &gt; 50]">
<div class="result-item"><span class="code"><xsl:value-of select="code"/></span> — <xsl:value-of select="name"/> — <xsl:value-of select="students"/> students</div>
</xsl:for-each>
</div>

<div id="q4" class="query-result">
<xsl:for-each select="/courses/course[credits = 4]">
<div class="result-item"><span class="code"><xsl:value-of select="code"/></span> — <xsl:value-of select="name"/> — <xsl:value-of select="credits"/> credits</div>
</xsl:for-each>
</div>

<div id="q5" class="query-result">
<xsl:for-each select="/courses/course[type = 'Theory']">
<div class="result-item"><span class="code"><xsl:value-of select="code"/></span> — <xsl:value-of select="name"/> — <xsl:value-of select="type"/></div>
</xsl:for-each>
</div>

<div id="q6" class="query-result">
<xsl:for-each select="/courses/course[type = 'Theory' and students &gt; 50]/name">
<div class="result-item"><xsl:value-of select="."/></div>
</xsl:for-each>
</div>

<div id="q7" class="query-result">
<xsl:for-each select="/courses/course[credits &gt;= 4]/faculty">
<div class="result-item"><xsl:value-of select="."/></div>
</xsl:for-each>
</div>

<div id="q8" class="query-result">
<xsl:for-each select="/courses/course[@id = 'C104']">
<div class="result-item"><span class="code"><xsl:value-of select="@id"/></span> — <xsl:value-of select="code"/> — <xsl:value-of select="name"/> — <xsl:value-of select="faculty"/> — <xsl:value-of select="students"/> students — <xsl:value-of select="credits"/> credits — <xsl:value-of select="type"/></div>
</xsl:for-each>
</div>

<div id="q9" class="query-result">
<xsl:for-each select="/courses/course[1]">
<div class="result-item"><span class="code"><xsl:value-of select="@id"/></span> — <xsl:value-of select="code"/> — <xsl:value-of select="name"/> — <xsl:value-of select="students"/> students</div>
</xsl:for-each>
</div>

<div id="q10" class="query-result">
<xsl:for-each select="/courses/course[last()]">
<div class="result-item"><span class="code"><xsl:value-of select="@id"/></span> — <xsl:value-of select="code"/> — <xsl:value-of select="name"/> — <xsl:value-of select="students"/> students</div>
</xsl:for-each>
</div>

</div>
</div>

<div class="cards">

<div class="card"><div class="label">Total Courses</div><div class="value"><xsl:value-of select="count(/courses/course)"/></div></div>
<div class="card"><div class="label">Theory Courses</div><div class="value"><xsl:value-of select="count(/courses/course[type='Theory'])"/></div></div>
<div class="card">
<div class="label">Highest Enrollment</div>
<div class="value">
<xsl:for-each select="/courses/course"><xsl:sort select="students" data-type="number" order="descending"/><xsl:if test="position()=1"><xsl:value-of select="students"/></xsl:if></xsl:for-each>
</div>
</div>
<div class="card"><div class="label">Courses &gt; 40</div><div class="value"><xsl:value-of select="count(/courses/course[students &gt; 40])"/></div></div>

</div>

<div class="section">
<div class="section-header">
<h2>High Enrollment Courses</h2>
<span class="tag">Students &gt; 40 | Descending</span>
</div>

<div class="table-wrap">
<table>
<tr><th>Course Code</th><th>Course Name</th><th>Faculty</th><th>Students</th><th>Credits</th><th>Type</th></tr>

<xsl:for-each select="/courses/course[students &gt; 40]">
<xsl:sort select="students" data-type="number" order="descending"/>
<tr>
<td class="code"><xsl:value-of select="code"/></td>
<td><xsl:value-of select="name"/></td>
<td><xsl:value-of select="faculty"/></td>
<td class="student"><xsl:value-of select="students"/></td>
<td><xsl:value-of select="credits"/></td>
<td><span class="type"><xsl:value-of select="type"/></span></td>
</tr>
</xsl:for-each>

</table>
</div>
</div>

</div>


<script>
var select = document.getElementById("querySelect");
var xpathDisplay = document.getElementById("xpathDisplay");
var button = document.getElementById("showResult");
var results = document.querySelectorAll(".query-result");

function updateResult() {
    var option = select.options[select.selectedIndex];
    xpathDisplay.textContent = option.getAttribute("data-xpath");

    for (var i = 0; i &lt; results.length; i++) {
        results[i].classList.remove("active");
    }

    var selected = document.getElementById(select.value);
    if (selected) {
        selected.classList.add("active");
    }
}

select.addEventListener("change", updateResult);
button.addEventListener("click", updateResult);
updateResult();
</script>

</body>
</html>

</xsl:template>
</xsl:stylesheet>
