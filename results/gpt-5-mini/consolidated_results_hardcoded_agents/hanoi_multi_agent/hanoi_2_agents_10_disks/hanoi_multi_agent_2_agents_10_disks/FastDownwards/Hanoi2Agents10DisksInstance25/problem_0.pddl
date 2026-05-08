; Target: FastDownward
(define (problem hanoi_3_disks)
  (:domain hanoi_multiagent)
  (:objects
    A B C - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left: C (bottom) <- B <- A (top)
    (on A B)
    (on B C)
    (on C left)

    ;; Clear places / tops: A is top of stack on left; middle and right are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; Size relations (disk-to-disk)
    (smaller A B)
    (smaller A C)
    (smaller B C)

    ;; For simplicity and uniform precondition checking we assert that every disk is
    ;; considered "larger" than/compatible with pegs (so moving onto an empty peg is allowed).
    ;; These facts ensure the single precondition (smaller ?d ?to) holds when ?to is a peg.
    (smaller A left)
    (smaller A middle)
    (smaller A right)
    (smaller B left)
    (smaller B middle)
    (smaller B right)
    (smaller C left)
    (smaller C middle)
    (smaller C right)
  )

  ;; Goal: move entire tower from left to middle with proper stacking (C bottom)
  (:goal (and
    (on C middle)
    (on B C)
    (on A B)
  ))
)