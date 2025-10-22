(define (problem hanoi-6-instance12)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
  )

  (:init
    ;; size ordering: a smallest, f largest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; initial tower on left: top->bottom A,B,C,D,E,F mapped to a,b,c,d,e,f
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f left)

    ;; clear facts: top disk and empty pegs are clear
    (clear a)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ;; goal tower on right: top->bottom a,b,c,d,e,f (i.e., same stacking order, on relations)
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f right)
    )
  )
)