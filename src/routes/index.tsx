import { createFileRoute } from "@tanstack/react-router";
import { useState, type FormEvent } from "react";
import { ArrowUpRight, CheckCircle2, Github, Linkedin, Mail, Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";

export const Route = createFileRoute("/")({
  head: () => ({ meta: [
    { title: "Ahmer Ali | Flutter Full-Stack Developer" },
    { name: "description", content: "Ahmer Ali builds polished cross-platform Flutter apps and scalable full-stack products." },
    { property: "og:title", content: "Ahmer Ali | Flutter Full-Stack Developer" },
    { property: "og:description", content: "Cross-platform Flutter apps and scalable full-stack products, built end to end." },
    { property: "og:type", content: "website" },
    { name: "twitter:card", content: "summary_large_image" },
  ] }),
  component: Portfolio,
});

const skills = [
  ["Flutter & Dart", 95], ["State Management (Bloc, Riverpod)", 92],
  ["Firebase / Cloud", 90], ["Python (Django, FastAPI)", 90],
  ["REST & GraphQL APIs", 88], ["Node.js Backend", 84], ["CI/CD & Testing", 80],
] as const;
const tools = ["Flutter", "Dart", "Bloc", "Riverpod", "GetX", "Firebase", "REST", "GraphQL", "Node.js", "Python", "Django", "FastAPI", "PostgreSQL", "Docker", "GitHub Actions", "Playwright", "Figma", "Kotlin"];
const projects = [
  { n:"01", title:"ShopNest — Commerce App", body:"Cross-platform storefront with cart, payments, and real-time order tracking. Flutter front end on a Node.js and PostgreSQL API.", tags:["Flutter","Riverpod","Node.js","Stripe"] },
  { n:"02", title:"HabitFlow — Productivity", body:"Offline-first habit tracker with streaks, cloud sync, and insightful analytics. Syncs seamlessly across devices.", tags:["Flutter","Bloc","SQLite","Firebase"] },
  { n:"03", title:"TravelMate — Trip Planner", body:"Collaborative itinerary planner with maps, offline access, and AI-generated suggestions for every stop.", tags:["Flutter","GetX","GraphQL","Google Maps"] },
  { n:"04", title:"InvoicePro — SaaS Dashboard", body:"Billing and invoicing web app with role-based access, PDF generation, and subscription management.", tags:["Flutter Web","Dart","Cloud","Stripe"] },
];
const experience = [
 {year:"2023 — Present", role:"Senior Flutter Developer", company:"Studio Pixel", points:["Lead a team building 4 production apps used by 250k+ users.","Cut release-cycle time 40% with a shared CI/CD pipeline.","Championed clean architecture and comprehensive widget testing."]},
 {year:"2021 — 2023", role:"Full-Stack Flutter Developer", company:"BrightLabs", points:["Shipped end-to-end features across mobile, web, and backend APIs.","Designed scalable PostgreSQL schemas powering real-time features.","Mentored junior developers and ran weekly code reviews."]},
 {year:"2019 — 2021", role:"Mobile Developer", company:"Appforge Studio", points:["Built and published 12+ client apps to the App Store and Play Store.","Integrated payments, maps, and push-notification services.","Established a reusable widget library adopted across all projects."]},
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
    <h1>Flutter <span>Full-Stack Developer</span></h1>
    <p className="hero-copy">I craft fast, beautiful cross-platform apps from a single Flutter codebase — and the scalable Python and Node.js backends that power them. One stack, end to end.</p>
    <div className="hero-actions"><Button asChild size="lg"><a href="#projects">View my work</a></Button><Button asChild size="lg" variant="outline"><a href="#contact">Get in touch</a></Button></div>
    <div className="metrics"><span><b>50+</b> apps shipped</span><i/><span><b>8+</b> years building</span><i/><span><b>250k+</b> users reached</span></div>
   </div></section>

   <section id="about" className="content-section about-section"><div className="section-grid">
    <div><p className="section-label">ABOUT</p><p className="about-copy">I'm a full-stack developer who treats <strong>Flutter</strong> as my native language. One codebase reaches Android, iOS, web, and desktop without cutting corners on performance or polish. On the server side, I build the Python and Node.js APIs and data layers those apps depend on — so features ship fast and scale cleanly.</p></div>
    <div className="care-card"><h3>What I care about</h3><ul>{["Clean, testable, maintainable architecture","Smooth 60fps animations and delightful micro-interactions","Backends designed for offline-first and real-time sync","Accessible UI that works for everyone"].map(x=><li key={x}>{x}</li>)}</ul></div>
   </div></section>

   <section id="skills" className="content-section tinted"><div className="wide-wrap"><p className="section-label">SKILLS</p><h2>One stack, <span>full range</span></h2><div className="skills-grid">
    <div className="skill-list">{skills.map(([name,p])=><div className="skill" key={name}><div><span>{name}</span><b>{p}%</b></div><div className="track"><i style={{width:`${p}%`}}/></div></div>)}</div>
    <div className="toolbox"><p>My toolkit is deliberately focused — Flutter and Dart at the core, with the server technologies needed to ship complete products without hand-offs slowing you down.</p><div className="tags">{tools.map(t=><span key={t}>{t}</span>)}</div></div>
   </div></div></section>

   <section id="projects" className="content-section"><div className="wide-wrap"><p className="section-label">PROJECTS</p><h2>Selected <span>work</span></h2><div className="project-grid">{projects.map(p=><article className="project-card" key={p.n}><div className="project-top"><span>{p.n}</span><ArrowUpRight/></div><h3>{p.title}</h3><p>{p.body}</p><div className="tags">{p.tags.map(t=><span key={t}>{t}</span>)}</div></article>)}</div></div></section>

   <section id="experience" className="content-section tinted"><div className="wide-wrap"><p className="section-label">EXPERIENCE</p><h2>Where I've <span>built</span></h2><div className="timeline">{experience.map((e,i)=><article className="job" key={e.year}><div className="dot">{i+1}</div><p className="job-year">{e.year}</p><div><h3>{e.role}</h3><p className="company">{e.company}</p><ul>{e.points.map(x=><li key={x}>{x}</li>)}</ul></div></article>)}</div></div></section>

   <section id="contact" className="content-section contact-section"><div className="section-grid"><div><p className="section-label">CONTACT</p><h2>Let's build something <span>great</span></h2><p className="contact-copy">Have an app idea, a product to ship, or a team that needs a Flutter expert? I'd love to hear about it.</p><div className="contact-links"><a href="mailto:hello@ahmerali.dev"><Mail/>hello@ahmerali.dev</a><a href="https://github.com/" target="_blank" rel="noreferrer"><Github/>github.com/ahmerali</a><a href="https://linkedin.com/" target="_blank" rel="noreferrer"><Linkedin/>in/ahmerali</a></div></div>
    <form className="contact-form" onSubmit={submit}><label>Name<input required name="name" placeholder="Your name"/></label><label>Email<input required name="email" type="email" placeholder="you@example.com"/></label><label>Message<textarea required name="message" rows={4} placeholder="Tell me about your project"/></label><Button type="submit" size="lg">Send message <ArrowUpRight/></Button>{sent&&<p className="sent"><CheckCircle2/> Thanks — your message is ready to send.</p>}</form>
   </div></section>
  </main><footer><div className="wide-wrap"><a href="#home" className="wordmark"><Mark small/><span>Ahmer<span>.dev</span></span></a><p>Designed & built with care.</p><p>© 2026 Ahmer Ali</p></div></footer>
 </div>
}
