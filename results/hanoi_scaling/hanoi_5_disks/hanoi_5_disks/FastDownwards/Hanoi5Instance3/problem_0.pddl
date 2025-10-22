(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
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

    ;; size (transitive pairs): A < B < C < D < E (A smallest, E largest)
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