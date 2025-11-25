(define (problem hanoi-4-disks-left-to-right)
  (:domain hanoi-domain)

  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left peg: bottom D, then C, then B, then A (A smallest, D largest)
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear/top facts: only A is top of the initial stack; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering assumptions (agent-derived, declared explicitly)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; All disks must be stacked on the right peg in the same order:
    ;; bottom D on right, C on D, B on C, A on B
    (on D right)
    (on C D)
    (on B C)
    (on A B)

    ;; Hard constraint: the middle peg must be empty in the final state
    (clear middle)
  ))
)