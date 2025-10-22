(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    a b c d e f g h - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacked configuration on the left peg: top -> bottom: a,b,c,d,e,f,g,h
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h left)

    ;; Clear predicates: top disk a is clear; the two empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; Size ordering: a is smallest, h is largest
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
      ;; Goal: same stacked order, but base on the right peg
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h right)
    )
  )
)