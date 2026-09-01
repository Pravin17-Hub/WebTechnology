const courses = [
  { code: "CSE301", name: "Web Technology", credits: 4, type: "Core" },
  { code: "CSE302", name: "Database Management Systems", credits: 4, type: "Core" },
  { code: "CSE303", name: "Computer Networks", credits: 3, type: "Core" },
  { code: "CSE304", name: "Artificial Intelligence", credits: 4, type: "Elective" },
  { code: "CSE305", name: "Cloud Computing", credits: 3, type: "Elective" },
  { code: "CSE306", name: "Cyber Security Fundamentals", credits: 3, type: "Elective" }
];

const courseTableBody = document.getElementById("courseTableBody");
const courseOptions = document.getElementById("courseOptions");
const form = document.getElementById("registrationForm");

function renderCourses() {
  courseTableBody.innerHTML = courses.map(c => `
    <tr>
      <td>${c.code}</td><td>${c.name}</td><td>${c.credits}</td><td>${c.type}</td>
    </tr>`).join("");

  courseOptions.innerHTML = courses.map((c, i) => `
    <div class="course-option">
      <input type="checkbox" id="course-${i}" name="courses" value="${c.code}">
      <label for="course-${i}">
        <span class="credit-pill">${c.credits} cr</span>
        <strong>${c.name}</strong>
        <small>${c.code} · ${c.type}</small>
      </label>
    </div>`).join("");
}

function getSelectedCourses() {
  return [...document.querySelectorAll('input[name="courses"]:checked')]
    .map(input => courses.find(course => course.code === input.value));
}

function calculateSummary(selectedCourses) {
  const totalCourses = selectedCourses.length;
  const totalCredits = selectedCourses.reduce((sum, course) => sum + course.credits, 0);
  document.getElementById("totalCourses").textContent = totalCourses;
  document.getElementById("totalCredits").textContent = totalCredits;

  document.getElementById("selectedList").innerHTML = selectedCourses.map(c => `
    <div class="selected-item"><span>${c.code} · ${c.name}</span><span>${c.credits}</span></div>
  `).join("");

  document.getElementById("selectionCount").textContent =
    `${totalCourses} selected`;

  return { totalCourses, totalCredits };
}

function updatePreview() {
  const selected = getSelectedCourses();
  calculateSummary(selected);
  document.getElementById("summaryEmpty").classList.toggle("hidden", selected.length > 0);
  document.getElementById("summaryContent").classList.toggle("hidden", selected.length === 0);

  document.getElementById("summaryName").textContent =
    document.getElementById("studentName").value.trim() || "Student";
  document.getElementById("summaryRegister").textContent =
    document.getElementById("registerNumber").value.trim() || "Register number pending";
  document.getElementById("summaryDepartment").textContent =
    document.getElementById("department").value || "—";
  const sem = document.getElementById("semester").value;
  document.getElementById("summarySemester").textContent = sem ? `Semester ${sem}` : "—";
}

function showError(message) {
  const box = document.getElementById("formMessage");
  box.textContent = message;
  box.classList.add("show");
  box.scrollIntoView({ behavior: "smooth", block: "center" });
}

function clearError() {
  document.getElementById("formMessage").classList.remove("show");
}

function validateForm() {
  const registerNumber = document.getElementById("registerNumber").value.trim();
  const studentName = document.getElementById("studentName").value.trim();
  const email = document.getElementById("email").value.trim();
  const department = document.getElementById("department").value;
  const semester = Number(document.getElementById("semester").value);
  const selected = getSelectedCourses();

  if (!registerNumber || !studentName || !email || !department || !semester) {
    return "Please complete all mandatory fields.";
  }
  if (!/^[A-Za-z0-9-]{5,20}$/.test(registerNumber)) {
    return "Register number must contain 5–20 letters, numbers or hyphens.";
  }
  if (!/^[A-Za-z .'-]{2,60}$/.test(studentName)) {
    return "Please enter a valid student name.";
  }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email)) {
    return "Please enter a valid email address.";
  }
  if (semester < 3 || semester > 8) {
    return "Semester must be between 3 and 8.";
  }
  if (selected.length === 0) {
    return "Select at least one course before registering.";
  }
  return "";
}

document.addEventListener("change", event => {
  if (event.target.matches('input[name="courses"], select')) {
    updatePreview();
    clearError();
  }
});

["registerNumber", "studentName", "email"].forEach(id => {
  document.getElementById(id).addEventListener("input", () => {
    updatePreview();
    clearError();
  });
});

form.addEventListener("submit", event => {
  event.preventDefault();

  const error = validateForm();
  if (error) {
    showError(error);
    console.log("Validation issue:", error);
    return;
  }

  const selected = getSelectedCourses();
  const totals = calculateSummary(selected);

  document.getElementById("summaryName").textContent =
    document.getElementById("studentName").value.trim();
  document.getElementById("summaryRegister").textContent =
    document.getElementById("registerNumber").value.trim();

  document.getElementById("summaryEmpty").classList.add("hidden");
  document.getElementById("summaryContent").classList.remove("hidden");
  document.getElementById("successBadge").classList.remove("hidden");

  console.log("Registration submitted:", {
    studentName: document.getElementById("studentName").value.trim(),
    registerNumber: document.getElementById("registerNumber").value.trim(),
    selectedCourses: selected,
    totalCourses: totals.totalCourses,
    totalCredits: totals.totalCredits
  });

  document.getElementById("summaryContent").scrollIntoView({ behavior: "smooth", block: "center" });
});

renderCourses();
console.log("SIMATS Course Registration Portal loaded.");
