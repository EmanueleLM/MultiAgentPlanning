(define (problem hanoi-5)
  (:domain hanoi-integrated)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    ; initial tower on left peg: E bottom, then D, C, B, A top
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; clear/top markers: A is top of the stack; middle and right are empty
    (clear A)
    (clear middle)
    (clear right)

    ; system initially ready for the first mover action
    (ready)

    ; static size relations (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; final tower on right peg: E bottom, then D, C, B, A top
    (on E right)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; other pegs must be empty
    (clear left)
    (clear middle)

    ; final state must have been audited
    (audited)
  ))
)