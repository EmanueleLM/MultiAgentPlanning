(define (problem Hanoi6Instance8)
  (:domain hanoi-domain)
  (:objects
    A B C D E F - disk
    left middle right - peg
    left_peg middle_peg right_peg orchestrator - agent
  )

  (:init
    ;; Initial stack on left: top -> bottom A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Top/clear facts
    (clear A)          ;; A is top of the entire stack
    (clear middle)     ;; middle peg is empty / clear
    (clear right)      ;; right peg is empty / clear

    ;; Size ordering (smaller) -- transitive pairs for 6 disks
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; Agent-to-peg role facts (agents kept explicit)
    (represents left_peg left)
    (represents middle_peg middle)
    (represents right_peg right)

    ;; Note: orchestrator agent exists but does not represent any peg (it coordinates)
  )

  (:goal (and
    ;; Goal: entire stack moved to the right peg, top -> bottom A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)
  ))
)