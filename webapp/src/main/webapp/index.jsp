<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Register for DevOps learning - AWS, Docker, Kubernetes, Jenkins, Terraform and more.">
  <title>DevOps Learning | Create your account</title>
  <style>
    :root {
      --primary: #4f46e5;
      --primary-dark: #4338ca;
      --primary-soft: #eef2ff;
      --text: #0f172a;
      --muted: #64748b;
      --border: #e2e8f0;
      --bg: #f8fafc;
      --card: #ffffff;
      --danger: #dc2626;
      --success: #16a34a;
      --radius: 14px;
      --shadow: 0 1px 2px rgba(15, 23, 42, .06), 0 8px 24px rgba(15, 23, 42, .06);
    }
    * { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      margin: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      font-size: 16px;
      line-height: 1.55;
      color: var(--text);
      background: var(--bg);
      -webkit-font-smoothing: antialiased;
    }
    a { color: var(--primary); text-decoration: none; transition: color .15s ease; }
    a:hover { color: var(--primary-dark); text-decoration: underline; }
    .wrap { max-width: 1120px; margin: 0 auto; padding: 0 24px; }

    /* Header */
    .site-header {
      position: sticky; top: 0; z-index: 10;
      background: rgba(255, 255, 255, .92);
      backdrop-filter: blur(8px);
      border-bottom: 1px solid var(--border);
    }
    .nav { display: flex; align-items: center; justify-content: space-between; height: 64px; }
    .brand { display: flex; align-items: center; gap: 10px; font-weight: 700; color: var(--text); }
    .brand:hover { text-decoration: none; color: var(--text); }
    .brand-mark {
      width: 34px; height: 34px; border-radius: 9px;
      background: var(--primary); color: #fff;
      display: grid; place-items: center; font-size: 14px; font-weight: 700;
    }
    .nav-links { display: flex; align-items: center; gap: 24px; }
    .nav-links a { color: var(--muted); font-weight: 500; font-size: 15px; }
    .nav-links a:hover { color: var(--text); text-decoration: none; }
    .btn-outline {
      padding: 8px 16px; border: 1px solid var(--border); border-radius: 10px;
      color: var(--text) !important; background: #fff;
      transition: border-color .15s ease, box-shadow .15s ease;
    }
    .btn-outline:hover { border-color: var(--primary); box-shadow: 0 0 0 3px var(--primary-soft); }

    /* Hero */
    .hero { display: grid; grid-template-columns: 1.05fr 1fr; gap: 56px; align-items: center; padding: 64px 0 56px; }
    .eyebrow {
      display: inline-block; padding: 4px 12px; border-radius: 999px;
      background: var(--primary-soft); color: var(--primary-dark);
      font-size: 13px; font-weight: 600; margin-bottom: 16px;
    }
    .hero h1 { font-size: 40px; line-height: 1.15; margin: 0 0 16px; letter-spacing: -.02em; }
    .hero p.lead { font-size: 18px; color: var(--muted); margin: 0 0 28px; max-width: 480px; }
    .features { list-style: none; margin: 0; padding: 0; display: grid; gap: 14px; }
    .features li { display: flex; gap: 12px; align-items: flex-start; color: var(--text); }
    .tick {
      flex: 0 0 24px; height: 24px; border-radius: 50%;
      background: var(--primary-soft); color: var(--primary);
      display: grid; place-items: center; margin-top: 1px;
    }
    .tick svg { width: 14px; height: 14px; }

    /* Form card */
    .card {
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); box-shadow: var(--shadow);
    }
    .form-card { padding: 32px; }
    .form-card h2 { margin: 0 0 4px; font-size: 22px; letter-spacing: -.01em; }
    .form-card .sub { margin: 0 0 22px; color: var(--muted); font-size: 15px; }
    .field { margin-bottom: 16px; }
    .field label { display: block; font-size: 14px; font-weight: 600; margin-bottom: 6px; }
    .input-wrap { position: relative; }
    .field input {
      width: 100%; padding: 11px 14px; font-size: 15px; font-family: inherit;
      color: var(--text); background: #fff;
      border: 1px solid var(--border); border-radius: 10px; outline: none;
      transition: border-color .15s ease, box-shadow .15s ease;
    }
    .field input::placeholder { color: #94a3b8; }
    .field input:hover { border-color: #cbd5e1; }
    .field input:focus { border-color: var(--primary); box-shadow: 0 0 0 3px rgba(79, 70, 229, .15); }
    .field input.touched:invalid { border-color: var(--danger); }
    .field input.touched:invalid:focus { box-shadow: 0 0 0 3px rgba(220, 38, 38, .15); }
    .has-toggle input { padding-right: 64px; }
    .toggle {
      position: absolute; right: 8px; top: 50%; transform: translateY(-50%);
      border: 0; background: transparent; color: var(--muted);
      font-size: 13px; font-weight: 600; padding: 6px 8px; border-radius: 6px; cursor: pointer;
    }
    .toggle:hover { color: var(--primary); background: var(--primary-soft); }
    .row { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
    .meter { height: 4px; border-radius: 4px; background: var(--border); margin-top: 8px; overflow: hidden; }
    .meter span { display: block; height: 100%; width: 0; background: var(--danger); transition: width .25s ease, background .25s ease; }
    .hint { font-size: 13px; margin-top: 6px; min-height: 18px; color: var(--muted); }
    .hint.error { color: var(--danger); }
    .hint.ok { color: var(--success); }
    .terms { font-size: 14px; color: var(--muted); margin: 18px 0; }

    .registerbtn {
      width: 100%; padding: 12px 18px; border: 0; border-radius: 10px;
      background: var(--primary); color: #fff;
      font-size: 15px; font-weight: 600; font-family: inherit; cursor: pointer;
      box-shadow: 0 1px 2px rgba(79, 70, 229, .3);
      transition: background .15s ease, transform .1s ease, box-shadow .15s ease;
    }
    .registerbtn:hover { background: var(--primary-dark); box-shadow: 0 6px 16px rgba(79, 70, 229, .28); }
    .registerbtn:active { transform: translateY(1px); }
    .registerbtn:focus-visible { outline: 3px solid rgba(79, 70, 229, .35); outline-offset: 2px; }
    .registerbtn.is-loading { pointer-events: none; opacity: .85; }
    .registerbtn.is-loading::before {
      content: ""; display: inline-block; width: 14px; height: 14px; margin-right: 8px;
      border: 2px solid rgba(255, 255, 255, .5); border-top-color: #fff; border-radius: 50%;
      vertical-align: -2px; animation: spin .7s linear infinite;
    }
    @keyframes spin { to { transform: rotate(360deg); } }
    .signin { text-align: center; margin: 18px 0 0; font-size: 14px; color: var(--muted); }

    /* About */
    .section { padding: 24px 0 64px; }
    .section-head { margin-bottom: 24px; }
    .section-head h2 { margin: 0 0 6px; font-size: 26px; letter-spacing: -.01em; }
    .section-head p { margin: 0; color: var(--muted); }
    .about { display: grid; grid-template-columns: 300px 1fr; gap: 24px; align-items: start; }
    .profile { padding: 28px; text-align: center; }
    .avatar {
      width: 84px; height: 84px; border-radius: 50%; margin: 0 auto 14px;
      background: var(--primary); color: #fff; font-size: 28px; font-weight: 700;
      display: grid; place-items: center; box-shadow: 0 0 0 6px var(--primary-soft);
    }
    .profile h3 { margin: 0; font-size: 20px; }
    .profile .role { margin: 4px 0 0; color: var(--muted); font-size: 15px; }
    .info-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; }
    .info { padding: 20px; transition: transform .2s ease, box-shadow .2s ease; }
    .info:hover { transform: translateY(-2px); box-shadow: 0 2px 4px rgba(15, 23, 42, .06), 0 12px 28px rgba(15, 23, 42, .08); }
    .icon {
      width: 38px; height: 38px; border-radius: 10px; margin-bottom: 12px;
      background: var(--primary-soft); color: var(--primary); display: grid; place-items: center;
    }
    .icon svg { width: 20px; height: 20px; }
    .info h4 { margin: 0 0 4px; font-size: 13px; text-transform: uppercase; letter-spacing: .05em; color: var(--muted); }
    .info p { margin: 0; font-size: 15px; }
    .skills-card { padding: 24px; margin-top: 16px; grid-column: 1 / -1; }
    .skills-card h4 { margin: 0 0 14px; font-size: 13px; text-transform: uppercase; letter-spacing: .05em; color: var(--muted); }
    .chips { display: flex; flex-wrap: wrap; gap: 8px; }
    .chip {
      padding: 6px 14px; border-radius: 999px; font-size: 14px; font-weight: 500;
      background: var(--primary-soft); color: var(--primary-dark);
      transition: background .15s ease, color .15s ease;
    }
    .chip:hover { background: var(--primary); color: #fff; }

    /* Footer */
    .thanks { text-align: center; padding: 40px 0; border-top: 1px solid var(--border); background: #fff; }
    .thanks h2 { margin: 0 0 4px; font-size: 22px; }
    .thanks p { margin: 0; color: var(--muted); }
    .copy { font-size: 13px; margin-top: 14px !important; }

    /* Responsive */
    @media (max-width: 920px) {
      .hero { grid-template-columns: 1fr; gap: 32px; padding: 40px 0; }
      .hero h1 { font-size: 34px; }
      .about { grid-template-columns: 1fr; }
      .info-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 560px) {
      .wrap { padding: 0 16px; }
      .nav-links a:not(.btn-outline) { display: none; }
      .hero h1 { font-size: 28px; }
      .hero p.lead { font-size: 16px; }
      .form-card { padding: 22px; }
      .row { grid-template-columns: 1fr; gap: 0; }
    }
    @media (prefers-reduced-motion: reduce) {
      * { transition: none !important; animation-duration: .01ms !important; scroll-behavior: auto !important; }
    }
  </style>
</head>
<body>

  <header class="site-header">
    <div class="wrap nav">
      <a class="brand" href="#top"><span class="brand-mark">DL</span> DevOps Learning</a>
      <nav class="nav-links" aria-label="Main">
        <a href="#register">Register</a>
        <a href="#about">About</a>
        <a href="#skills">Skills</a>
        <a class="btn-outline" href="#">Sign in</a>
      </nav>
    </div>
  </header>

  <main id="top">
    <section class="wrap hero" id="register">
      <div>
        <span class="eyebrow">DevOps Learning</span>
        <h1>Start your DevOps learning journey today</h1>
        <p class="lead">Create your account to get started with hands-on cloud and DevOps learning.</p>
        <ul class="features">
          <li><span class="tick"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></span>
            <span>AWS cloud services, hands-on</span></li>
          <li><span class="tick"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></span>
            <span>Docker, Kubernetes and CI/CD with Jenkins</span></li>
          <li><span class="tick"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg></span>
            <span>Infrastructure as code with Terraform and Ansible</span></li>
        </ul>
      </div>

      <div class="card form-card">
        <h2>Create your account</h2>
        <p class="sub">Please fill in this form to create an account.</p>

        <form action="action_page.php" id="regForm" novalidate>
          <div class="field">
            <label for="Name">Enter Name</label>
            <input type="text" placeholder="Enter Full Name" name="Name" id="Name" autocomplete="name" required>
          </div>

          <div class="row">
            <div class="field">
              <label for="mobile">Enter mobile</label>
              <input type="tel" inputmode="tel" placeholder="Enter mobile number" name="mobile" id="mobile" autocomplete="tel" required>
            </div>
            <div class="field">
              <label for="email">Enter Email</label>
              <input type="email" placeholder="Enter Email" name="email" id="email" autocomplete="email" required>
            </div>
          </div>

          <div class="field">
            <label for="psw">Password</label>
            <div class="input-wrap has-toggle">
              <input type="password" placeholder="Enter Password" name="psw" id="psw" autocomplete="new-password" required>
              <button type="button" class="toggle" data-target="psw" aria-label="Show or hide password">Show</button>
            </div>
            <div class="meter" aria-hidden="true"><span id="meterBar"></span></div>
          </div>

          <div class="field">
            <label for="psw-repeat">Repeat Password</label>
            <div class="input-wrap has-toggle">
              <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" autocomplete="new-password" required>
              <button type="button" class="toggle" data-target="psw-repeat" aria-label="Show or hide repeated password">Show</button>
            </div>
            <div class="hint" id="matchHint" role="status" aria-live="polite"></div>
          </div>

          <p class="terms">By creating an account you agree to our <a href="#">Terms &amp; Privacy</a>.</p>
          <button type="submit" class="registerbtn" id="submitBtn">Register</button>
        </form>

        <p class="signin">Already have an account? <a href="#">Sign in</a>.</p>
      </div>
    </section>

    <section class="wrap section" id="about">
      <div class="section-head">
        <h2>About the developer</h2>
        <p>The person behind this application.</p>
      </div>

      <div class="about">
        <div class="card profile">
          <div class="avatar" aria-hidden="true">TS</div>
          <h3>V Thamil Selvam</h3>
          <p class="role">AWS Cloud &amp; DevOps</p>
        </div>

        <div>
          <div class="info-grid">
            <div class="card info">
              <div class="icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13S3 17 3 10a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg></div>
              <h4>Location</h4>
              <p>Chennai, Tamil Nadu, India</p>
            </div>
            <div class="card info">
              <div class="icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></div>
              <h4>Education</h4>
              <p>UG, St. Thomas College of Arts and Science, Koyambedu, Chennai (2023&ndash;2026)</p>
            </div>
            <div class="card info">
              <div class="icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="7"/><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/></svg></div>
              <h4>Training</h4>
              <p>6-month AWS Cloud and DevOps program, SLS Institute</p>
            </div>
          </div>

          <div class="card skills-card" id="skills">
            <h4>Skills</h4>
            <div class="chips">
              <span class="chip">AWS</span>
              <span class="chip">Docker</span>
              <span class="chip">Kubernetes</span>
              <span class="chip">Ansible</span>
              <span class="chip">Jenkins</span>
              <span class="chip">Terraform</span>
              <span class="chip">Linux</span>
              <span class="chip">Shell scripting</span>
              <span class="chip">Prometheus</span>
              <span class="chip">Grafana</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="thanks">
    <div class="wrap">
      <h2>Thank You, Happy Learning</h2>
      <p>See You Again</p>
      <p class="copy">&copy; 2026 V Thamil Selvam</p>
    </div>
  </footer>

  <script>
    (function () {
      var form = document.getElementById('regForm');
      var psw = document.getElementById('psw');
      var rep = document.getElementById('psw-repeat');
      var hint = document.getElementById('matchHint');
      var bar = document.getElementById('meterBar');
      var btn = document.getElementById('submitBtn');
      var submitting = false;

      // Show / hide password
      var toggles = document.querySelectorAll('.toggle');
      for (var i = 0; i < toggles.length; i++) {
        toggles[i].addEventListener('click', function () {
          var input = document.getElementById(this.getAttribute('data-target'));
          var show = input.type === 'password';
          input.type = show ? 'text' : 'password';
          this.textContent = show ? 'Hide' : 'Show';
        });
      }

      // Show validation styling only after a field has been visited
      var inputs = form.querySelectorAll('input');
      for (var j = 0; j < inputs.length; j++) {
        inputs[j].addEventListener('blur', function () { this.classList.add('touched'); });
      }

      // Password strength meter
      function strength(v) {
        var s = 0;
        if (v.length >= 8) s++;
        if (/[a-z]/.test(v) && /[A-Z]/.test(v)) s++;
        if (/\d/.test(v)) s++;
        if (/[^A-Za-z0-9]/.test(v)) s++;
        return s;
      }
      psw.addEventListener('input', function () {
        var s = strength(psw.value);
        var colors = ['#dc2626', '#dc2626', '#f59e0b', '#84cc16', '#16a34a'];
        bar.style.width = (psw.value ? Math.max(s, 1) * 25 : 0) + '%';
        bar.style.background = colors[s];
        checkMatch();
      });

      // Password match check
      function checkMatch() {
        if (!rep.value) {
          rep.setCustomValidity('');
          hint.textContent = '';
          hint.className = 'hint';
          return;
        }
        if (psw.value !== rep.value) {
          rep.setCustomValidity('Passwords do not match');
          hint.textContent = 'Passwords do not match';
          hint.className = 'hint error';
        } else {
          rep.setCustomValidity('');
          hint.textContent = 'Passwords match';
          hint.className = 'hint ok';
        }
      }
      rep.addEventListener('input', checkMatch);

      // Submit: validate, then show loading state (form still posts to the original action)
      form.addEventListener('submit', function (e) {
        checkMatch();
        for (var k = 0; k < inputs.length; k++) { inputs[k].classList.add('touched'); }
        if (!form.checkValidity()) {
          e.preventDefault();
          var firstInvalid = form.querySelector(':invalid');
          if (firstInvalid) { firstInvalid.focus(); }
          return;
        }
        if (submitting) { e.preventDefault(); return; }
        submitting = true;
        btn.classList.add('is-loading');
        btn.textContent = 'Creating account...';
      });

      // Reset loading state if the user comes back with the browser Back button
      window.addEventListener('pageshow', function () {
        submitting = false;
        btn.classList.remove('is-loading');
        btn.textContent = 'Register';
      });
    })();
  </script>
</body>
</html>

