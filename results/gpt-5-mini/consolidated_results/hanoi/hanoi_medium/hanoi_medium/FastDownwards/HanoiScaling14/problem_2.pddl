(define (problem hanoi-five-instance)
  (:domain hanoi-five)

  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; Initial tower on the middle peg (bottom to top: E, D, C, B, A)
    (on E middle)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Top/empty indicators
    (clear A)
    (clear left)
    (clear right)

    ;; Size-ordering (transitive pairs for correctness of move-to-disk)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    (clear middle)
    (clear right)
  ))
)