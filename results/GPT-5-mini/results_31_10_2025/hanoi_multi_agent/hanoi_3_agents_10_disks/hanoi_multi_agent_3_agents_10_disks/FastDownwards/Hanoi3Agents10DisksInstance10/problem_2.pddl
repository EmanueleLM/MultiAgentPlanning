(define (problem hanoi3agents10disksinstance10)
  (:domain hanoi-multiagent-10)

  (:objects
    a b c d e f g h i j none - disk
    left middle right - peg
  )

  (:init
    (on a left) (on b left) (on c left) (on d left) (on e left)
    (on f left) (on g left) (on h left) (on i left) (on j left)

    (top a left)
    (empty middle)
    (empty right)

    (below a b)
    (below b c)
    (below c d)
    (below d e)
    (below e f)
    (below f g)
    (below g h)
    (below h i)
    (below i j)
    (below j none)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    (canmove1 a) (canmove1 b) (canmove1 c) (canmove1 d)
    (canmove2 e) (canmove2 f) (canmove2 g)
    (canmove3 h) (canmove3 i) (canmove3 j)
  )

  (:goal (and
    (on c left) (on e left) (on f left) (on g left) (on h left) (on i left) (on j left)
    (top c left)
    (below c e) (below e f) (below f g) (below g h) (below h i) (below i j) (below j none)

    (empty middle)

    (on a right) (on b right) (on d right)
    (top a right)
    (below a b) (below b d) (below d none)
  ))