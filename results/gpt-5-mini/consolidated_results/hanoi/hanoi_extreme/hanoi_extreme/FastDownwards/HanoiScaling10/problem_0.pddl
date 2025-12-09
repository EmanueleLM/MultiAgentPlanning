(define (problem hanoi-7-middle-to-right)
  (:domain hanoi)

  (:objects
    ; pegs
    p-left p-middle p-right - peg

    ; disks (d1 is smallest, d7 largest)
    d1 d2 d3 d4 d5 d6 d7 - disk

    ; note: peg and disk are subtypes of support implicitly via domain typing
  )

  (:init
    ; Initial stack: all disks stacked on the middle peg with size order preserved:
    ; top -> bottom: d1,d2,d3,d4,d5,d6,d7 on p-middle
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 p-middle)

    ; clear facts: only the top disk and empty pegs are clear initially
    (clear d1)
    (clear p-left)
    (clear p-right)
    ; p-middle is not clear (has stack)

    ; full size ordering (static): smaller relations for all strictly smaller pairs
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  ;; Goal: entire stack moved from the middle peg to the right peg, preserving ordering,
  ;; and the left peg must end empty. Also require the middle peg be empty (full stack moved).
  (:goal (and
    ;; same stacked ordering on the right peg (bottom d7 on p-right)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 p-right)

    ;; left peg empty
    (clear p-left)

    ;; middle peg empty (ensures the stack was moved off p-middle)
    (clear p-middle)

    ;; top disk clear at the end (explicit terminal condition)
    (clear d1)
  ))
)