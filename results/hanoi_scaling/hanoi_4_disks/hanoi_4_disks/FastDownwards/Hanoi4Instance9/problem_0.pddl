(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; size ordering (A smallest, D largest)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; initial stack on left: top->bottom A B C D
    (on A left)
    (on B A)
    (on C B)
    (on D C)

    ;; clear predicates: top elements and empty pegs
    (clear A)       ;; A is top of the stack
    ;; B, C, D are not clear (have disks on them) so not listed
    ;; left peg has disk on it (A), so not clear
    (clear middle)  ;; middle peg empty
    (clear right)   ;; right peg empty
  )

  (:goal (and
    ;; goal: entire stack moved to right peg with same order top->bottom A B C D
    (on A right)
    (on B A)
    (on C B)
    (on D C)
  ))
)