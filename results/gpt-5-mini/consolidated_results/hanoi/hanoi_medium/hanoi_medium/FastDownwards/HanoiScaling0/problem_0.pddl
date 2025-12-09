(define (problem hanoi-5)
  (:domain hanoi-domain)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial immediate-support chain: A on B, B on C, C on D, D on E, E on middle
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E middle)

    ;; clear flags inferred from the on chain: A, left, right are clear; middle is not clear; B..E not clear except A
    (clear A)
    (clear left)
    (clear right)

    ;; static size ordering facts
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; final immediate-support chain should be identical among disks but rooted at right peg:
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E right)

      ;; left and middle pegs must be empty in the final state
      (clear left)
      (clear middle)

      ;; right peg must be occupied (i.e., not clear)
      (not (clear right))
    )
  )
)