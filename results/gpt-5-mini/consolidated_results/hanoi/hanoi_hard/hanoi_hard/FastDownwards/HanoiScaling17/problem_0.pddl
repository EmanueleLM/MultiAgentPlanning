(define (problem hanoi-6-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    pegA pegB pegC - peg
  )

  (:init
    ; initial stack: all disks on pegA with d6 bottom, d1 top
    (on-peg d6 pegA)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ; top disk on pegA is d1
    (top d1 pegA)

    ; other pegs empty initially
    (empty pegB)
    (empty pegC)

    ; size ordering: d1 < d2 < d3 < d4 < d5 < d6
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  ; Goal: entire tower reconstructed on pegC in same order (d6 bottom ... d1 top).
  ; Explicitly require final placement predicates and emptiness of other pegs.
  (:goal
    (and
      ; final direct placement relations for target pegC
      (on-peg d6 pegC)
      (on-disk d5 d6)
      (on-disk d4 d5)
      (on-disk d3 d4)
      (on-disk d2 d3)
      (on-disk d1 d2)

      ; top of pegC is d1
      (top d1 pegC)

      ; source pegs empty at termination
      (empty pegA)
      (empty pegB)
    )
  )
)