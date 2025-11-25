(define (problem hanoi_5_disks)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; immediate size-ordering chain only (transitive closure handled in action preconditions)
    (smaller A B)
    (smaller B C)
    (smaller C D)
    (smaller D E)

    ;; initial stack on middle from top to bottom: A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E middle)

    ;; only facts that are true initially (absent facts are false by default)
    (clear A)
    (clear left)
    (clear right)
  )

  (:goal (and
    ;; final configuration: right peg holds from top to bottom A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
    ;; left and middle pegs must be empty
    (clear left)
    (clear middle)
  ))
)