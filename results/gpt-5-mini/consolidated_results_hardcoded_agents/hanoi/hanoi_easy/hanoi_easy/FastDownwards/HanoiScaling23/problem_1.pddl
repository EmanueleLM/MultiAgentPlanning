(define (problem hanoi-4disks-3pegs)
  (:domain hanoi-multiagent)

  (:objects
    mover - agent
    d1 d2 d3 d4 - disk
    left mid right - peg
  )

  (:init
    (agent mover)

    ;; initial stack on left: d4 bottom on the peg, then d3 on d4, d2 on d3, d1 on d2 (d1 is top)
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (top d1)

    ;; peg emptiness for pegs with no immediate disk
    (empty mid)
    (empty right)

    ;; size ordering (static): d1 < d2 < d3 < d4
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    ;; full stack on right in correct order
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (top d1)

    ;; intermediate peg must be empty; left should be empty
    (empty mid)
    (empty left)
  ))
)