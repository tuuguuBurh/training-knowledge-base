# NT Сургалт — Day 1 Заавар

Тавтай морил! Энэ заавар нь сургалтын эхний өдөр хийх алхмуудыг тайлбарлана.

---

## 1. Репо клонлох

```bash
git clone <repo-url>
cd nt-training
```

---

## 2. Өөрийн branch-руу шилжих

Таны branch аль хэдийн үүссэн байна. Доорх командыг ажиллуул:

```bash
git checkout trainee/nt-[username]
```

Жишээ:
```bash
git checkout trainee/nt-bat
```

Амжилттай шилжвэл ийм харагдана:
```
Switched to branch 'trainee/nt-bat'
```

---

## 3. Хавтасны бүтцийг ойлгох

```
trainee/nt-bat/
├── phase-1/
│   ├── 01-web-fundamentals/    ← дасгал 1-ийн ажлын хавтас
│   ├── 02-semantic-html/
│   ├── 03-css-layout/
│   ├── 04-javascript-core/
│   ├── 05-fetch-api/
│   └── 06-git-practice/
├── phase-2/
└── README.md                   ← өөрийн checkpoint хүснэгт
```

`README.md`-ийг нээж, өөрийн нэр болон Buddy-ийн handle зөв байгааг шалга.

---

## 4. Дасгал эхлүүлэх

Дасгал бүрт шинэ branch үүсгэнэ. **Заавал өөрийн үндсэн branch-аас** үүсгэх ёстой:

```bash
git checkout trainee/nt-[username]                        # үндсэн branch руу эхлээд шилж
git checkout -b trainee/nt-[username]/web-fundamentals    # дасгалын branch үүсгэ
```

Код бичиж дуусаад commit хий:

```bash
git add .
git commit -m "feat: web fundamentals — page layout and devtools"
git push -u origin trainee/nt-[username]/web-fundamentals
```

---

## 5. PR нээх

GitHub дээр PR нээхдээ:

- **Base branch:** `trainee/nt-[username]` ← заавал энэ байна, `main` биш!
- **Head branch:** `trainee/nt-[username]/web-fundamentals`

PR нээх үед template автоматаар ачаалагдана. Бүх хэсгийг гүйцэд бөглө.

---

## 6. README checkpoint шинэчлэх

PR нээсний дараа `trainee/nt-[username]/README.md`-ийн тухайн дасгалын мөрийг шинэчил:

| Талбар | Юу бичих |
|--------|---------|
| Байдал | `Хянагдаж байна` |
| PR Линк | PR-ийн URL |
| Live URL | Hosting хийсэн бол URL, эсэхгүй бол хоосон |

---

## 7. Wiki-д KB entry бичих

PR merge болсны дараа Wiki-ийн тухайн topic хуудсанд KB entry нэм:

1. Репогийн **Wiki** tab-руу орно.
2. Тохирох topic хуудсыг (жишээ: *Web Fundamentals*) нээнэ.
3. `docs/wiki-templates/kb-artifact-template.md`-ийн загварыг хуулж бөглөнө.
4. Хуудасны **дээд талд** нэмнэ (хамгийн шинэ нь дээр байх ёстой).

KB entry бичигдэж дуусаад л README-ийн Байдал → **Дууссан** болгоно.

---

## 8. Саад тулгарвал

Хэрэв гацвал:

1. **Эхлээд өөрөө** Google, MDN, StackOverflow-оос хай.
2. Хайснаа тэмдэглэж ав — PR-ийн "Саад бэрхшээл" хэсэгт бичих шаардлагатай.
3. 20 минутын дараа ч шийдэж чадаагүй бол GitHub Issue нээж Buddy-даа мэдэгдэ → **🚧 Саад** template ашиглана.

---

## Шат дуусгасны дараа

Бүх 6 дасгал дууссан үед:

1. GitHub-д **🎓 Шат дуусгасан** issue нээнэ.
2. PR линкүүд болон Wiki KB линкүүдийг бөглөнө.
3. Buddy шалгаж баталгаажуулна.

**Амжилт хүснэ!** 🚀
