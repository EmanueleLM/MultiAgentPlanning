(define (problem hanoi-4)
  (:domain hanoi)

  ;; Objects: 4 disks (A smallest ... D largest) and 3 pegs
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacked configuration on 'left' peg (top-to-bottom A, B, C, D):
    ;; encode as on relations such that A on B, B on C, C on D, D on left
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; Clear predicates: top disk A is clear; empty pegs are clear (middle, right)
    (clear A)
    (clear middle)
    (clear right)

    ;; Static allowed placements derived from size ordering A < B < C < D
    ;; A disk may be placed onto any peg (peg is always allowed destination when empty)
    ;; and a disk may be placed onto any strictly larger disk.
    ;; Allowed: disk -> peg (all combinations)
    (allowed A left)   (allowed A middle)   (allowed A right)
    (allowed B left)   (allowed B middle)   (allowed B right)
    (allowed C left)   (allowed C middle)   (allowed C right)
    (allowed D left)   (allowed D middle)   (allowed D right)

    ;; Allowed: disk -> larger disk
    ;; A is smaller than B,C,D
    (allowed A B) (allowed A C) (allowed A D)
    ;; B smaller than C,D
    (allowed B C) (allowed B D)
    ;; C smaller than D
    (allowed C D)

    ;; Note: disallowed placements (e.g., placing B on A) are simply not listed.
    ;; This encodes the global rule "never place a larger disk on top of a smaller one".
  )

  (:goal (and
    ;; Goal stack on 'right' peg top-to-bottom A, B, C, D:
    ;; encoded as on relations: A on B, B on C, C on D, D on right
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; Goal also requires left and middle pegs be empty:
    ;; explicitly require that no disk is on left or middle (negative literals).
    (not (on A left))   (not (on B left))   (not (on C left))   (not (on D left))
    (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle))
  ))
)