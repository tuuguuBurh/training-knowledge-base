

<p align="center">
  <img src="docs/assets/logo.png" alt="Company Logo" width="200"/>
</p>

# NT Training Knowledge Base

NT сургалтын репозитори
Trainee-нүүдийн сургалтын хугацаанд олж авсан мэдлэгийг төвлөрүүлэх хамтын мэдлэгийн сан.

---

## 📚 Сургалтын гарын авлага

Сургалтын бүрэн гарын авлагыг доорх линкээс уншина уу:

📄 **[NT Сургалтын гарын авлага](https://docs.google.com/document/d/120SSM7xps0u7bfwCHNRW50Lw60UasKP-87gM_jUYwTo/edit?tab=t.0)**

> Дасгал бүрийн дэлгэрэнгүй тайлбар, шаардлага, хүлээлт бүгд энд байна. Эхлэхийн өмнө заавал уншина уу.

---

## 🎯 Сургалтын тойм

> Онол заах бус, харин NT-ийн төслүүд дээр шууд ажиллахад хэрэгтэй практик ур чадварыг олгож, мэдлэгийг тань баталгаажуулах явдал юм.

| Шат | Чиглэл | Хугацаа | Жин | Үр дүн |
|-----|--------|---------|-----|--------|
| **1-р шат** | Суурь Шалгалт & Зөрүүг Нөхөх | 3–5 ажлын өдөр | Богино | Мэдлэгийн зөрүүг нөхөж, NT-ийн хэрэглүүртэй ажиллахад бэлэн болно |
| **2-р шат** | NT Tech Stack: TypeScript, Фреймворк, Хэрэглүүр | 5 ажлын өдөр | Дунд | TypeScript болон фреймворк ашиглан бие даасан функц (feature) хөгжүүлж сурна |
| **3-р шат** | Бодит Дадлага | 10 ажлын өдөр | Хамгийн урт | Production код дээр ажиллаж, дизайнаас эцсийн бодит хувилбар хүртэлх даалгаврыг бие даан гүйцэтгэнэ |

**Нийт хугацаа: ~1 сар.** Бодит дадлага үндсэн сургалт 3-р шатанд явагддаг тул энэ үед хамгийн их хугацааг зарцуулна.

---

## Репо бүтэц

```
trainee/
└── nt-[username]/
    ├── phase-1/
    │   ├── 01-web-fundamentals/
    │   ├── 02-semantic-html/
    │   ├── 03-css-layout/
    │   ├── 04-javascript-core/
    │   ├── 05-fetch-api/
    │   └── 06-git-practice/
    ├── phase-2/
    └── README.md        ← checkpoint хүснэгт
```

Шинэ trainee-ийн scaffold-ийн жишээг `trainee/_template/`-ээс харна уу.

---

## Branch дүрэм

| Branch | Зорилго |
|--------|---------|
| `main` | Хамгаалагдсан — шууд push хориотой |
| `trainee/nt-[username]` | Trainee-ийн үндсэн branch — Buddy PR-ийг энд merge хийнэ |
| `trainee/nt-[username]/[дасгал]` | Дасгал бүрийн ажлын branch |

**PR дүрэм:** PR нь хэзээ ч `main`-руу биш, `trainee/nt-[username]`-руу нээгдэнэ. Buddy хянаж merge хийнэ.

---

## Дасгал бүрийн Branch нэрлэх жишээ

```
trainee/nt-bat/web-fundamentals
trainee/nt-bat/semantic-html
trainee/nt-bat/css-layout
trainee/nt-bat/javascript-core
trainee/nt-bat/fetch-api
trainee/nt-bat/git-merge-conflict
```

---



## Ажлын урсгал — Шинэ trainee орж ирвэл яах вэ?

### 1. Бэлтгэл `(Admin)`
Нэг команд ажиллуулахад бүх зүйл автоматаар тохируулагдана:

```bash
./scripts/new-trainee.sh bat @saran
```

- `trainee/nt-bat` branch үүсгэж push хийнэ
- Checkpoint хүснэгт бүхий README бэлдэнэ
- `@saran`-ийг PR бүрийн auto-reviewer болгон бүртгэнэ
- Trainee болон Buddy-д repo хандах эрх олгоно

---

### 2. Эхлэх `(Trainee)`
Trainee `docs/onboarding.md` дагаж clone хийнэ:

```bash
git clone <repo-url>
git checkout trainee/nt-bat
```

---

### 3. Дасгал бүрт `(Trainee)`

```
trainee/nt-bat          ← үндсэн branch-аас
  └── trainee/nt-bat/web-fundamentals   ← шинэ branch үүсгэнэ
```

1. Дасгалын branch үүсгэж ажлаа хийнэ
2. PR нээнэ — base нь `trainee/nt-bat`, `main` биш
3. PR template-ийн бүх хэсгийг бөглөнө
4. README checkpoint хүснэгтэд → `Хянагдаж байна` болгоно

---

### 4. Хянах `(Buddy)`

- `@saran` CODEOWNERS-ийн ачаар GitHub-аас автоматаар review хүсэлт авна
- CI `validate-structure.sh` ажиллаж хавтасны бүтэц шалгана
- Buddy code + хавтасны бүтэц хянана, feedback өгнө
- Бэлэн болоход `trainee/nt-bat`-руу merge хийнэ

---

### 5. KB entry бичих `(Trainee)`

PR merge болсны дараа:

1. Wiki-ийн тухайн topic хуудсанд KB entry нэмнэ (`docs/wiki-templates/kb-artifact-template.md` загвараар)
2. README checkpoint хүснэгтэд → `Дууссан` болгоно

---

### 6. Шат дуусгах `(Trainee → Buddy)`

Бүх 6 дасгал дууссан үед trainee `🎓 Шат дуусгасан` issue нээнэ.
Buddy бүх PR, README, Wiki entry-г нэгдсэн байдлаар шалгаж баталгаажуулна.

> Buddy хэдэн trainee хаана байгааг нэг дороос харах бол:
> ```bash
> ./scripts/progress.sh
> ```

---

## Day 1 — Репо тохиргоо

Шинэ trainee нэмэхдээ гараар хийхийн оронд скриптийг ажиллуул:

```bash
./scripts/new-trainee.sh <нэр> <@buddy-handle>
```

**Жишээ:**
```bash
./scripts/new-trainee.sh bat @saran   # → trainee/nt-bat branch үүснэ
```

Скрипт дараах зүйлийг автоматаар хийнэ:
- `trainee/nt-bat` branch үүсгэж push хийнэ
- `_template/`-ийг хуулж README-ийн нэр, buddy-г бөглөнө
- `.github/CODEOWNERS`-д `@saran`-ийг reviewer болгож бүртгэнэ

Дараа нь Trainee болон Buddy-д repo-д хандах эрх олгоно.

## Buddy — Өдөр тутмын хариуцлага

Buddy дасгал бүрт:

1. PR-ийг хянана (code + хавтасны бүтэц).
2. `trainee/nt-[username]/README.md` checkpoint хүснэгт шинэчлэгдсэн эсэхийг шалгана.
3. Wiki-д KB artifact entry бичигдсэн эсэхийг шалгана.
4. Бүгд бэлэн болсон үед `trainee/nt-[username]`-руу merge хийнэ.

---

## Wiki — Мэдлэгийн сан

Репогийн **Wiki** tab-д бүх trainee-н KB entry хадгалагдана:

```
NT Training KB
├── Home
├── Phase 1
│   ├── Web Fundamentals
│   ├── Semantic HTML + Forms
│   ├── CSS Layout (Flexbox + Grid)
│   ├── JavaScript Core (ES6+ + Event Loop)
│   ├── Fetch API + Async JS
│   └── Git — Merge Conflicts
├── Phase 2
└── Conventions
    └── KB Artifact Template
```

Wiki-д оруулах template-үүд `docs/wiki-templates/`-д байна.

---

## Git Policy

Branch нэрлэх, commit мессеж, PR, code review, merge дүрэм бүгдийг энд харна:

📄 [docs/git-policy.md](docs/git-policy.md)

---

## Скриптүүд

| Команд | Юу хийдэг |
|--------|-----------|
| `./scripts/new-trainee.sh <нэр> <@buddy>` | Шинэ trainee-ийн branch, scaffold, CODEOWNERS бэлдэнэ |
| `./scripts/progress.sh` | Бүх trainee-ийн дасгалын байдлыг dashboard-д харуулна |
| `./validate-structure.sh` | Хавтасны бүтэц зөв байгааг шалгана (CI автоматаар ажиллуулна) |

---

## Шатны дуусгах нөхцөл (Buddy gate)

Шат "Дууссан" гэж тооцогдохын тулд:

- [ ] Тухайн шатны бүх PR `trainee/nt-[username]`-д merge болсон
- [ ] README checkpoint хүснэгт шинэчлэгдсэн
- [ ] Wiki-д KB artifact entry бичигдсэн, template дагасан
- [ ] Buddy хоёуланг нь (code + Wiki entry) хянасан
