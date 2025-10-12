#import emoji: face

#set page(
  paper: "a4",
  header: context { 
    grid(
      columns: (1fr, 1fr),
      align(left)[#link((page: 4, x: 0pt, y: 300pt))[Problem Master List]],
      [#align(right)[D.E.S.P.A.I.R]]
    )
     },
  footer: context {
    grid(
      columns: (1.2fr, 0.8fr),
      [`Template, problems made with love by @mortrpestl`],
      [#align(right)[#counter(page).get().first()]]
    )
  },
  margin: (x: 40pt)
)

#set text(
  font: "Consolas"
)
#set heading(numbering: "1.")
#set par(
  justify: true,
  leading: 0.52em, 
)


#align(center, text(30pt, weight:"bold")[
  D.E.S.P.A.I.R.])

#align(center, text(15pt)[
  Diogn's Eldritch Stories in Preparation for Annoying, Insightful Regrets
])
#align(center, text(10pt)[
  A *Mock HOPE Template* made with Love by *Diogn Mortera* (\@mortrpestl)])
#set heading(numbering: "1.1.1") // Default numbering
#show heading.where(level: 1) : set heading(numbering: none)

#counter(heading).step(level: 1)

#let mine = counter("a")
#mine.update(c => 1)


#let problem(
  title: [],
  img: none,
  caption: none,
  statement: [],
  task: [],
  examples: [],
  constraints: [],
  color: rgb("#843f3f"),
  diff: none,
  invert: false,
) = block(
  fill: if invert { color } else { color.lighten(85%) },
  inset: 1em,
  width: 100%,
)[
  #set text(
    font: "Consolas",
    fill: if invert { color.lighten(85%) } else { color },
    size: 11pt,
  )


  #align(center)[
    #grid(
      columns:3,
    [#text(size:13pt)[(#context mine.display())]],
    [#text(size:15pt)[== #(title)]],
    [#text(size:13pt)[(#context mine.display())]]
    )
    ]
  #mine.step()
  // #align(center)[
  //     Difficulty: #diff / 10
  // ]

  #if img != none [
    #align(center)[#img]

    #if caption != none [
      #align(center)[
        #text(9pt, style: "italic")[#caption]
      ]
    ]
  ]

  #(statement)
  
  #text(11pt, weight: "bold")[*Task Details*]\ 
  #(task)

  #text(11pt, weight: "bold")[*Examples*]\ 
  #(examples)

  #text(11pt, weight: "bold")[*Constraints*]\ 
  #(constraints)
]

\ 
*What's the Point?*

Mock HOPE lol /j I\

I  made these questions not primarily for you to code them but for you to exercise your insights and thought-making process.


Solutions and (most of the time) code for non-heartbreaks can be found in the end of the document and the folder where you probably found this document, respectively. If you can't solve it, read the solutions for insights #face.smile 


*On Grading Yourself*

You can submit code in my _Offline Judge_ #face.cool. 
- Your code for most problems and their subtasks can be checked by going to the "`(submit code here!) offline_judge`" folder;
- going to the folder with the problem number/function name;
- typing your code into `student_solution`.py, and;
- running the file. 

Verdicts will be provided as the file is run. Isn't that cool! 

Do note that #text(fill: rgb("#b32b32"))[_there may be mistakes in the logic of my solutions/test cases I am unaware of_.] Please let me know, but please do understand if ever #emoji.heart.broken there will be things that will slip under my proofreading #face.sad

  - That said, I update the file and test cases regularly if I find them / someone points them out so regularly #text(size:15pt, fill: rgb("#dd4d4d"))[_redownload_] the folder. Next MOCK Hope, maybe I have set up my own Online Judge though so that isn't a problem, but for now, please do that if you want updated versions of test cases #face.smile


*Other Information*

- _The difficulty can *fluctuate*_. #text(size:15pt, fill: rgb("#1d621a"))[*SKIP* PROBLEMS _YOU THINK YOU CAN'T SOLVE/WILL TAKE TIME_ and TRY THEM IF AND ONLY IF YOU'RE SURE YOU'VE SOLVED ALL THAT YOU COMFORTABLY CAN.]\ - #text(size:9pt)[This should be the general strat even in the actual HOPE. Some problems may be easier or harder depending on what you're good at. I tried my best to have a variety of problem types to this set.]

- #text(size:15pt, fill: rgb("#27829b"))[Knowing and (coding) the first *1-2* subtasks of each problem should be your goal.] 
  If you can do that, you're pretty well-off in HOPE.

  - #text(size:9pt)[Some subtasks are _*special forms of heartbreaks*_. They will be signified with a _reaction image_ related to the question. When you see this, the heartbreak is _*definitely* #underline[not easy]_ to solve and probably not necessary for the HOPE either #text(size:7.5pt)[(but you never know)]. They will also usually not have model solutions because nobody is reading all of that.]





- And of course, Don't stress yourself out.
#set align(horizon)

#pagebreak()

Before you proceed: #underline[https://oj.dcs.upd.edu.ph/cs11cheatsheet/]


= Recall
(if you don't know/recall a term, try to learn it! or skip it...)

*You May Include a Summary of Tricks/Important Things to Remember Here*
  - Like this...
  - Or like this!!
*Maybe even have multiple sections?*
  - More!

#set heading(numbering: none)

#pagebreak()
 #set text(size: 11pt)

#line(length: 100%, stroke:0.25pt+rgb("#2b2880"))
The *DESPAIR* questions can be found in the next pages.

Feel free to time yourself for _3 hours_.

#text(size:15pt)[
_*[total with heartbreaks] is perfect. Try to get at least [total without heartbreaks] in 3 hours if you want to pass.*_]


If you want to test, I recommend checking your solution against the examples for now, then checking it with the model solutions later (to avoid wasting time).

Good luck!


#line(length: 100%, stroke:0.25pt+rgb("#2b2880"))
#pagebreak()

= Problems






#set align(left)
#show link: underline

#pagebreak()
#problem(
  title: "Sample Problem Here",
  caption: "Use your freedom of expression here.",
  img: image("assets/sample.png",width: 60%),
  diff: ".",
  color: rgb("#1a3c52"),
  invert: false,
  statement: [
    A problem should be as concise as possible, while still providing succinct and adequate explanation to the answerer.
    
    What is the meaning of life? Given $a$ and $b$, the meaning is $a+b$.
     ],
  task: [
    Define `solve(a,b)`. You are free to add other parameters inside `solve()`, but it cannot have no parameters (as of October 2025). 
    
    Avoid changing the function name, or you will have to change more files in `tester_packet`. More on checking in the `tester_packet` README
    
    The output should be a single `int`.
       ],
  examples: [
      `solve(1,2)` results in 3
      ],
  constraints: [
    If there are  parameters, be absolutely clear. Make sure your constraints match your test cases, especially if you have many subtasks.

    Example:\
    $0<=a,b<=20$

    #emoji.heart 200 points: Insert easy subtask \
    #face.heart 169 points: No further constraints\
    #emoji.heart.broken 0 points: Insert buff here
     ]
)

#pagebreak()

// template for problems
#problem(
  title: "Empty Problem for Template",
  caption: "...",
  diff: ".",
  color: rgb("#7c245c"),
  invert: true,
  statement: [
     ],
  task: [
       ],
  examples: [
      ],
  constraints: [
     ]
)
