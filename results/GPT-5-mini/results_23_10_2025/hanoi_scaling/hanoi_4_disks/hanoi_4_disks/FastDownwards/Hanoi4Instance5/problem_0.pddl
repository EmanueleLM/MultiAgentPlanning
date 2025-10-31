(define (problem hanoi-4-disks)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; initial locations (left peg has top->bottom A,B,C,D)
    (at A left)
    (at B left)
    (at C left)
    (at D left)

    ;; size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    (at A right)
    (at B right)
    (at C right)
    (at D right)
  ))
)