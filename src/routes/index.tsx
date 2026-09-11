import { createFileRoute } from "@tanstack/react-router";
import { useState, type FormEvent } from "react";
import { ArrowUpRight, CheckCircle2, Github, Linkedin, Mail, Menu, Phone, X } from "lucide-react";
import { Button } from "@/components/ui/button";

export const Route = createFileRoute("/")({
  head: () => ({ meta: [
    { title: "Ahmer Ali | Python & Flutter Developer" },
    { name: "description", content: "Ahmer Ali is a Python, data science, Streamlit, and Flutter developer based in Hyderabad, Sindh." },
    { property: "og:title", content: "Ahmer Ali | Python & Flutter Developer" },
    { property: "og:description", content: "Python, data science, Streamlit, and Flutter projects by Ahmer Ali." },
    { property: "og:type", content: "website" },
    { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: Portfolio,
});

const skills = [
  ["Python", 92], ["Data Analysis (Pandas, NumPy)", 88],
  ["Streamlit", 85], ["Data Visualization (Matplotlib)", 82],
  ["Flutter & Dart", 80], ["Scikit-learn", 78], ["Firebase / Firestore", 76],
  ["Supabase", 74],
] as const;
const tools = ["Python", "NumPy", "Pandas", "Matplotlib", "Scikit-learn", "Streamlit", "Flutter", "Dart", "Firebase", "Firestore", "Supabase", "Java", "C", "Jupyter Notebook", "Google Colab", "Android Studio", "VS Code"];
const projects = [
  { n:"01", title:"My Digital CV and Portfolio", body:"A deployed personal portfolio with a clean, modern interface showcasing professional skills, projects, and achievements.", tags:["Python","Streamlit"], href:"https://ahmer-ali-ahmerali-portfolio.hf.space" },
  { n:"02", title:"Student Performance Predictor", body:"An AI-powered web app using multiple machine-learning algorithms to predict academic performance and support educational improvement.", tags:["Python","Streamlit","Scikit-learn"], href:"https://ahmer-ali-datascience.hf.space" },
  { n:"03", title:"TEQNITEHUB — Data & Tech Web App", body:"An interactive data and technology application with a modern interface and dynamic cloud-backed functionality.", tags:["Python","Streamlit","Firestore"], href:"https://teqnite.streamlit.app" },
  { n:"04", title:"Property Management System", body:"A contract project for adding, managing, and searching properties, with secure authentication and real-time data.", tags:["Flutter","Dart","Firebase"], href:"https://managmentsystemapp.netlify.app" },
];
const experience = [
 {year:"2026 — Present", role:"Data Science Intern", company:"Technify · Hyderabad, Pakistan", points:["Analyze, preprocess, and visualize real-world datasets.","Apply Pandas, NumPy, and Matplotlib to practical data tasks.","Build insights and analytical reports that support decision-making."]},
 {year:"Aug 2024 — Present", role:"Programming Instructor", company:"Private Tutoring · Self-Employed", points:["Teach Python and Flutter through one-on-one and small-group sessions.","Design custom lessons, hands-on projects, exercises, and assessments.","Help students debug applications and adopt coding best practices."]},
 {year:"Jun — Jul 2025", role:"Python Programming Intern", company:"Gexton Education · Hyderabad, Pakistan", points:["Completed a six-week practical Python development internship.","Built an intelligent virtual assistant with predictive analytics.","Developed attendance management and automated quiz systems."]},
];

function Mark({ small=false }: { small?: boolean }) { return <span className={`brand-mark ${small ? "brand-mark-small" : ""}`} aria-hidden="true"><i/><i/></span> }
function Portfolio() {
 const [open,setOpen]=useState(false); const [sent,setSent]=useState(false);
 const submit=(e:FormEvent)=>{e.preventDefault();setSent(true)};
 const nav=["About","Skills","Projects","Experience","Contact"];
 return <div className="portfolio-shell">
  <header className="topbar"><nav className="nav-wrap" aria-label="Main navigation">
   <a href="#home" className="wordmark"><Mark small/><span>Ahmer<span>.dev</span></span></a>
   <div className="desktop-nav">{nav.map(v=><a key={v} href={`#${v.toLowerCase()}`}>{v}</a>)}</div>
   <Button asChild size="sm" className="hire-button"><a href="#contact">Hire me</a></Button>
   <Button variant="ghost" size="icon" className="menu-button" aria-label="Toggle navigation" onClick={()=>setOpen(!open)}>{open?<X/>:<Menu/>}</Button>
  </nav>{open&&<div className="mobile-nav">{nav.map(v=><a key={v} href={`#${v.toLowerCase()}`} onClick={()=>setOpen(false)}>{v}</a>)}</div>}</header>

  <main>
   <section id="home" className="hero section-pad"><div className="hero-glow"/><div className="hero-content">
    <div className="hero-mark"><Mark/></div><p className="eyebrow">HELLO, I'M AHMER ALI</p>
    <h1>Python & <span>Flutter Developer</span></h1>
    <p className="hero-copy">I build practical data-driven applications, machine-learning experiences, and responsive mobile products with Python, Streamlit, Flutter, and Firebase.</p>
    <div className="hero-actions"><Button asChild size="lg"><a href="#projects">View my work</a></Button><Button asChild size="lg" variant="outline"><a href="#contact">Get in touch</a></Button></div>
    <div className="metrics"><span><b>4</b> featured projects</span><i/><span><b>2</b> active tech tracks</span><i/><span><b>2028</b> BSCS graduate</span></div>
   </div></section>

   <section id="about" className="content-section about-section"><div className="section-grid">
    <div><p className="section-label">ABOUT</p><p className="about-copy">I'm a Computer Science student at the <strong>University of Sindh</strong>, building at the intersection of Python, data science, and Flutter. Alongside developing real-world applications, I teach Python and Flutter through practical, project-based lessons tailored to every learner.</p></div>
    <div className="care-card"><h3>What I bring</h3><ul>{["Practical, project-based problem solving","Patience and adaptability as an instructor","Hands-on Python, Flutter, and data science experience","A commitment to continuous learning and student success"].map(x=><li key={x}>{x}</li>)}</ul></div>
   </div></section>

   <section id="skills" className="content-section tinted"><div className="wide-wrap"><p className="section-label">SKILLS</p><h2>One stack, <span>full range</span></h2><div className="skills-grid">
    <div className="skill-list">{skills.map(([name,p])=><div className="skill" key={name}><div><span>{name}</span><b>{p}%</b></div><div className="track"><i style={{width:`${p}%`}}/></div></div>)}</div>
     <div className="toolbox"><p>My toolkit spans Python data workflows, machine learning, Streamlit applications, cross-platform Flutter development, and cloud-backed products with Supabase.</p><div className="tags">{tools.map(t=><span key={t}>{t}</span>)}</div></div>
   </div></div></section>

   <section id="projects" className="content-section"><div className="wide-wrap"><p className="section-label">PROJECTS</p><h2>Selected <span>work</span></h2><div className="project-grid">{projects.map(p=><a className="project-card" key={p.n} href={p.href} target="_blank" rel="noreferrer"><div className="project-top"><span>{p.n}</span><ArrowUpRight/></div><h3>{p.title}</h3><p>{p.body}</p><div className="tags">{p.tags.map(t=><span key={t}>{t}</span>)}</div></a>)}</div></div></section>

   <section id="experience" className="content-section tinted"><div className="wide-wrap"><p className="section-label">EXPERIENCE</p><h2>Where I've <span>built</span></h2><div className="timeline">{experience.map((e,i)=><article className="job" key={e.year}><div className="dot">{i+1}</div><p className="job-year">{e.year}</p><div><h3>{e.role}</h3><p className="company">{e.company}</p><ul>{e.points.map(x=><li key={x}>{x}</li>)}</ul></div></article>)}</div></div></section>

   <section id="contact" className="content-section contact-section"><div className="section-grid"><div><p className="section-label">CONTACT</p><h2>Let's build something <span>great</span></h2><p className="contact-copy">Have a Python, data science, Flutter, or teaching opportunity? I'd love to hear about it. I'm based in Hyderabad, Sindh.</p><div className="contact-links"><a href="mailto:ahmeralishoukat.work@gmail.com"><Mail/>ahmeralishoukat.work@gmail.com</a><a href="tel:+923152661772"><Phone/>+92 315-2661772</a><a href="https://github.com/Ahmer109" target="_blank" rel="noreferrer"><Github/>github.com/Ahmer109</a><a href="https://www.linkedin.com/in/a-ahmer/" target="_blank" rel="noreferrer"><Linkedin/>linkedin.com/in/a-ahmer</a></div></div>
    <form className="contact-form" onSubmit={submit}><label>Name<input required name="name" placeholder="Your name"/></label><label>Email<input required name="email" type="email" placeholder="you@example.com"/></label><label>Message<textarea required name="message" rows={4} placeholder="Tell me about your project"/></label><Button type="submit" size="lg">Send message <ArrowUpRight/></Button>{sent&&<p className="sent"><CheckCircle2/> Thanks — your message is ready to send.</p>}</form>
   </div></section>
  </main><footer><div className="wide-wrap"><a href="#home" className="wordmark"><Mark small/><span>Ahmer<span>.dev</span></span></a><p>Designed & built with care.</p><p>© 2026 Ahmer Ali</p></div></footer>
 </div>
}
