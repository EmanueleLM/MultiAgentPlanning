(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    a b c d e f g h - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top-to-bottom a,b,c,d,e,f,g,h
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h left)

    ;; clear: top disk and empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering (static): smaller x y means x is smaller than y
    ;; all ordered pairs where the first disk is smaller than the second
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h)
    (smaller e f) (smaller e g) (smaller e h)
    (smaller f g) (smaller f h)
    (smaller g h)
  )

  (:goal
    (and
      ;; full stack on right: top-to-bottom a,b,c,d,e,f,g,h
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h right)

      ;; ensure other pegs are empty and top is clear
      (clear left)
      (clear middle)
      (clear a)
    )
  )
)