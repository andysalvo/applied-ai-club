Project Workflow
The development process separates design, interface generation, and content development.
1. Figma — Structure & Layout
Pages are first structured in Figma to define:
	•	Page layout
	•	Section hierarchy
	•	Component structure
	•	Reusable design elements
Each major page follows a consistent format:
	•	Hero section
	•	Where AI Appears
	•	What AI Helps With
	•	Limits & Misunderstandings
	•	Key Considerations
Figma is used to ensure consistency across majors before implementation.

2. v0 — Interface Generation
Once the structure is finalized, v0 is used to generate the frontend components.
v0 produces:
	•	Responsive UI components
	•	Modular section blocks
	•	Clean HTML/CSS/React code
The goal is a frontend-heavy system with minimal backend complexity.

3. Codex — Content Expansion
Base text for each major is expanded and refined using Codex.
Codex is used to:
	•	Expand high-level explanations
	•	Add real-world examples
	•	Clarify how AI is discussed in professional contexts
	•	Maintain discipline-specific accuracy
This step turns initial descriptions into fully developed informational content.

4. Wix — Deployment
The final interface is embedded into the Student AI Hub website.
Implementation method:
	•	Pages generated with v0
	•	Hosted externally (recommended: Vercel)
	•	Embedded in Wix using HTML iframe embeds
This keeps Wix as the site shell while the AI major pages remain modular and maintainable.
