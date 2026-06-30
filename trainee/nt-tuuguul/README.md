# Tuuguul — NT Сургалт 1-р Шат

## 1-р Шатны Checkpoint-үүд

Live сайт (GitHub Pages, `main`): <https://tuuguuburh.github.io/training-knowledge-base/>

| # | Дасгал | Хавтас | Байдал | PR Линк | Live URL | Нөхсөн зөрүү / тэмдэглэл |
|---|--------|--------|--------|---------|----------|-------------------------|
| 1 | Web Fundamentals | 01-web-fundamentals/ | Дууссан | — | [Live](https://tuuguuburh.github.io/training-knowledge-base/trainee/nt-tuuguul/phase-1/01-web-fundamentals/index.html) | Хостинг ба HTTPS зөрүү нөхсөн: VPS vs shared hosting (нөөц, root эрх, өргөтгөл), SSL/TLS гэрчилгээ HTTPS-д TLS handshake-ээр найдвартай холболт үүсгэдэг |
| 2 | Semantic HTML + Forms | 02-semantic-html/ | Дууссан | — | [Live](https://tuuguuburh.github.io/training-knowledge-base/trainee/nt-tuuguul/phase-1/02-semantic-html/index.html) | Semantic элементүүд тодруулсан: `<sup>`/`<sub>` (зэрэг, химийн томьёо), `<marquee>` хуучирсан тул CSS animation-аар солих |
| 3 | CSS Responsive Grid | 03-css-layout/ | Дууссан | — | [Live](https://tuuguuburh.github.io/training-knowledge-base/trainee/nt-tuuguul/phase-1/03-css-layout/index.html) | Grid + media query-гээр responsive layout |
| 4 | JavaScript Core (ES6+) | 04-javascript-core/ | Дууссан | — | [Live](https://tuuguuburh.github.io/training-knowledge-base/trainee/nt-tuuguul/phase-1/04-javascript-core/index.html) | Event loop зөрүү нөхсөн: call stack → microtask (Promise) → macrotask (setTimeout) дараалал; closure |
| 5 | Fetch API App | 05-fetch-api/ | Дууссан | — | [Live](https://tuuguuburh.github.io/training-knowledge-base/trainee/nt-tuuguul/phase-1/05-fetch-api/index.html) | async/await, алдаа барих, loading төлөв |
| 6 | Git / Merge Conflict | 06-git-practice/ | Дууссан | [#1](https://github.com/tuuguuBurh/training-knowledge-base/pull/1) | N/A | Branch, PR, merge conflict шийдэх дадлага |

### Байдлын тайлбар

| Байдал | Утга |
|--------|------|
| **Хүлээгдэж байна** | Эхлээгүй эсвэл хийж байгаа |
| **Хянагдаж байна** | PR нээгдсэн, Buddy хянаж байна |
| **Дууссан** | PR merge болж, Wiki KB entry бичигдсэн |

### Линкүүд

- Үндсэн branch: `trainee/nt-tuuguul`
- Buddy: `@nt-dukk`
- Эхэлсэн огноо: `2026-06-30`

---

## Явцын тойм

**Байдал:** 1-р болон 2-р шат бүрэн дууссан ✅ — 3-р шат (бодит дадлага) руу орох бэлэн.

### 1-р шат — Суурь шалгалт
6/6 дасгал дууссан (HTML суурь, semantic HTML + формууд, CSS responsive grid,
JavaScript ES6+, Fetch API, Git/merge conflict).

### 2-р шат — TypeScript + Tooling
Онолын тэмдэглэлүүд бүрэн: TypeScript яагаад, interface/type/generic,
discriminated unions, ZOD, tsconfig суурь, Biome, NT Git урсгал, CI/CD.
PR: [#1 phase2](https://github.com/tuuguuBurh/training-knowledge-base/pull/1) (merged).

**Project — weather-cli:** Open-Meteo API-аас Улаанбаатарын цаг агаар татдаг
TypeScript CLI. Цэвэр модульчлал (`index.ts` / `weather.ts` / `types.ts`),
зөв алдаа барих, Biome + CI бүрэн тохируулсан.
