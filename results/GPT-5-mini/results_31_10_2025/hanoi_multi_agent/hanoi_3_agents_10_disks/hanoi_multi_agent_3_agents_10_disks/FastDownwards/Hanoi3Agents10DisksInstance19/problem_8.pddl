(define (problem Hanoi3Agents10DisksInstance19)
  (:domain multiagent-hanoi-3agents)
  (:objects
    a b c d e f g h i j left middle right
  )

  (:init
    ; initial stack on left peg, top->bottom: a b c d e f g h i j
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    (clear a)
    (clear middle)
    (clear right)

    ; agent movement permissions
    (allowed1 a) (allowed1 b) (allowed1 c) (allowed1 d)
    (allowed2 e) (allowed2 f) (allowed2 g)
    (allowed3 h) (allowed3 i) (allowed3 j)

    ; can place on any peg
    (canplace a left) (canplace a middle) (canplace a right)
    (canplace b left) (canplace b middle) (canplace b right)
    (canplace c left) (canplace c middle) (canplace c right)
    (canplace d left) (canplace d middle) (canplace d right)
    (canplace e left) (canplace e middle) (canplace e right)
    (canplace f left) (canplace f middle) (canplace f right)
    (canplace g left) (canplace g middle) (canplace g right)
    (canplace h left) (canplace h middle) (canplace h right)
    (canplace i left) (canplace i middle) (canplace i right)
    (canplace j left) (canplace j middle) (canplace j right)

    ; can place smaller disk onto any strictly larger disk
    (canplace a b) (canplace a c) (canplace a d) (canplace a e) (canplace a f) (canplace a g) (canplace a h) (canplace a i) (canplace a j)
    (canplace b c) (canplace b d) (canplace b e) (canplace b f) (canplace b g) (canplace b h) (canplace b i) (canplace b j)
    (canplace c d) (canplace c e) (canplace c f) (canplace c g) (canplace c h) (canplace c i) (canplace c j)
    (canplace d e) (canplace d f) (canplace d g) (canplace d h) (canplace d i) (canplace d j)
    (canplace e f) (canplace e g) (canplace e h) (canplace e i) (canplace e j)
    (canplace f g) (canplace f h) (canplace f i) (canplace f j)
    (canplace g h) (canplace g i) (canplace g j)
    (canplace h i) (canplace h j)
    (canplace i j)
  )

  (:goal (and
    ; goal: left peg (top->bottom) a, d, e, f, g, h, i, j
    ; middle peg (top) b
    ; right peg (top) c
    (on a d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
    (on b middle)
    (on c right)
  ))
)