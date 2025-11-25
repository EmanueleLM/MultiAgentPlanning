; Problem: Tower of Hanoi, 4-disks: A (smallest), B, C, D (largest)
; Initial: all disks stacked on 'left' (D bottom, C, B, A top)
; Goal: entire stack moved to 'right' preserving order (D bottom, C, B, A top)
(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
  )

  (:init
    ; size ordering (smaller X Y means X may be placed on Y)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ; initial positions (immediate support)
    ; A on B, B on C, C on D, D on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ; top-of-peg facts: A is the top disk on left
    (top A left)

    ; empty pegs: middle and right are empty initially
    (empty middle)
    (empty right)
  )

  ; Goal: all disks re-stacked on right in the same order and other pegs empty
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D right)
    (top A right)
    (empty left)
    (empty middle)
  ))
)