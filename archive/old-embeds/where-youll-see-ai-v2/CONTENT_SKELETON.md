# Content Skeleton - Where You'll See AI (Accounting)

## Writing voice

Analytical and plainspoken. Descriptive, not instructional.

## Field model

```ts
type ModularEmbedData = {
  id: string;
  role: "featured" | "support" | "context";
  title: string;
  lead: string;
  body: string;
  revealLabel: string;
  revealBody?: string;
  studentImplication?: string;
};
```

## Target word counts

- Featured lead: `14-20` words
- Featured body: `35-55` words
- Reveal body: `25-40` words
- Student implication: `12-20` words
- Support lead: `12-18` words
- Support body: `20-35` words
- Context in-class block: `18-30` words
- Context in-practice block: `18-32` words
- Each takeaway: `8-16` words

## Content integrity checks

- Each embed maps to one specific domain in the source text.
- No claims imply full AI autonomy.
- Language preserves judgment, oversight, and documentation themes.
