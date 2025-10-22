(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; initial tower on left: F bottom, then E, D, C, B, A top
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; clear: only top disk A and the two empty pegs middle and right are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D < E < F (expressed pairwise)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal
    (and
      ;; goal: entire tower moved to right peg in same size order F bottom ... A top
      (on F right)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)