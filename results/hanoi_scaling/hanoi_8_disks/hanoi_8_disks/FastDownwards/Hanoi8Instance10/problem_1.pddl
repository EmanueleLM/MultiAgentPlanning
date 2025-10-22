(define (problem hanoi-8-instance10)
  (:domain hanoi8instance10)
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

    ;; clear facts: top disk and the two empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; size ordering (static): smaller x y means x is smaller than y
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

      ;; other pegs empty (no disk directly on them)
      (clear left)
      (clear middle)
      ;; top disk on right must be clear? (top disk a remains clear only if nothing placed on it afterwards)
      ;; In the correct final stack the top disk a is clear.
      (clear a)
    )
  )
)