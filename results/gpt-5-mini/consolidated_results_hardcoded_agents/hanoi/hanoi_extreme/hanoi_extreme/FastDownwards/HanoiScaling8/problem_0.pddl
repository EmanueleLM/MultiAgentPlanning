(define (problem hanoi-7-mover)
  (:domain hanoi-mover)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on middle peg from bottom (G) to top (A):
    (on-peg G middle)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; The top-of-peg relation: A is the top disk of the middle peg stack
    (top-on A middle)
    (top A)

    ;; Other pegs are empty initially
    (empty left)
    (empty right)

    ;; Size ordering (A smallest, then B, ..., G largest).
    ;; Explicitly enumerate all strict pairs to make size checks explicit.
    ;; A < B..G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    ;; B < C..G
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    ;; C < D..G
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    ;; D < E..G
    (smaller D E) (smaller D F) (smaller D G)
    ;; E < F,G
    (smaller E F) (smaller E G)
    ;; F < G
    (smaller F G)
  )

  ;; Goal: move the entire stack to right peg in correct order,
  ;; and ensure left and middle pegs are empty at termination.
  ;; Explicit final on relations enforce correct ordering (A top ... G bottom).
  (:goal (and
    ;; Final direct-on relations describing the stack on right:
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; The top mapping for right peg
    (top-on A right)
    (top A)

    ;; Ensure other pegs are empty (left used only as auxiliary, must be empty at goal)
    (empty left)
    (empty middle)
  ))
)