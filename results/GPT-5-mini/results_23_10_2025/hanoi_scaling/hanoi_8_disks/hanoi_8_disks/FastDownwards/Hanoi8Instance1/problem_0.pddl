(define (problem hanoi-8-left-to-right)
  (:domain tower-of-hanoi-multiagent)
  (:objects
    a b c d e f g h - disk
    left middle right - peg
  )
  (:init
    ;; initial stacking top->bottom on left: a, b, c, d, e, f, g, h
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h left)

    ;; top disk facts for pegs
    (top a left)

    ;; other pegs are empty initially
    (empty middle)
    (empty right)

    ;; size relations: smaller X Y if size(X) < size(Y)
    ;; sizes: a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8
    ;; enumerate strict pairs
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h)
    (smaller e f) (smaller e g) (smaller e h)
    (smaller f g) (smaller f h)
    (smaller g h)
  )

  (:goal (and
    ;; desired final stacking top->bottom on right: a, b, c, d, e, f, g, h
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h right)
    ;; final top and empties consistent with that stacking
    (top a right)
    (empty left)
    (empty middle)
  ))
)