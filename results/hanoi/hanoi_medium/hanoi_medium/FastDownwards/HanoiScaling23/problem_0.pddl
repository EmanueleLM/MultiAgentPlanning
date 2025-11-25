(define (problem hanoi-5)
  (:domain hanoi-domain)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; initial locations (left peg top-to-bottom: A, B, C, D, E)
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)

    ; direct adjacency relationships (top-to-bottom chain)
    (directly_on A B)
    (directly_on B C)
    (directly_on C D)
    (directly_on D E)

    ; top and peg-empty facts
    (top A left)
    (peg_empty middle)
    (peg_empty right)

    ; static size ordering (larger X Y means X is larger than Y)
    (larger B A)
    (larger C A) (larger C B)
    (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)
  )

  ; Goal: all disks on right in correct stacking order, left and middle empty
  (:goal (and
    (on A right)
    (on B right)
    (on C right)
    (on D right)
    (on E right)

    (directly_on A B)
    (directly_on B C)
    (directly_on C D)
    (directly_on D E)

    (peg_empty left)
    (peg_empty middle)
  ))