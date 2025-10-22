(define (problem hanoi-4)
  (:domain hanoi)

  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacked configuration on 'left' peg (top-to-bottom A, B, C, D):
    ;; A on B, B on C, C on D, D on left
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; Clear predicates: top disk A is clear; empty pegs middle and right are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; Static allowed placements derived from size ordering A < B < C < D.
    ;; Allow placing any disk onto any peg (when peg is empty)...
    (allowed A left)   (allowed A middle)   (allowed A right)
    (allowed B left)   (allowed B middle)   (allowed B right)
    (allowed C left)   (allowed C middle)   (allowed C right)
    (allowed D left)   (allowed D middle)   (allowed D right)

    ;; ...and allow placing a disk onto any strictly larger disk.
    ;; A is smaller than B, C, D
    (allowed A B) (allowed A C) (allowed A D)
    ;; B smaller than C, D
    (allowed B C) (allowed B D)
    ;; C smaller than D
    (allowed C D)
  )

  (:goal (and
    ;; Goal stack on 'right' peg top-to-bottom A, B, C, D:
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; Ensure left and middle pegs are empty (no disk on them)
    (not (on A left))   (not (on B left))   (not (on C left))   (not (on D left))
    (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle))
  ))
)