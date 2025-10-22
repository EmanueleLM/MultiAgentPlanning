(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    ;; declare pegs also as places for clarity (typing requires explicit kinds)
    left_place middle_place right_place - place
  )
  ;; Note: Because domain declares types disk, peg, place separately, we need
  ;; the objects to be typed consistently with predicates expecting place.
  ;; To keep predicates simple in this problem, we will use pegs as places directly:
  ;; (Fast Downward accepts an object having a single declared type. To model that
  ;; pegs are usable where places are expected, we instead declare predicates to accept peg or disk.
  ;; For clarity and solver-readiness, we will not use the extra place objects above in init.
  (:init
    ;; initial tower on left (E bottom, D on E, C on D, B on C, A on B)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; clear: topmost disk A, middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D < E (transitive pairs included)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  ;; Goal: entire tower moved to right peg preserving order (E bottom ... A top)
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)