(define (problem hanoi-4disks-3pegs)
  (:domain hanoi-multiagent)

  (:objects
    mover - agent
    d1 d2 d3 d4 - disk
    left mid right - peg
  )

  (:init
    ;; Agent
    (agent mover)

    ;; Initial stacking (four disks on left peg; d4 bottom, then d3, d2, d1 top)
    (on-peg d4 left)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; Top-of-disk: only the smallest (d1) has nothing above at start
    (top d1)

    ;; Peg emptiness: left is occupied, middle and right are empty
    (not (empty left))   ;; left has at least one disk immediately on it
    (empty mid)
    (empty right)

    ;; Size ordering (static): d1 < d2 < d3 < d4
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; Placement permissions derived from sizes:
    ;; Pegs accept any disk as a support
    (can-place-peg left d1) (can-place-peg left d2) (can-place-peg left d3) (can-place-peg left d4)
    (can-place-peg mid d1)  (can-place-peg mid d2)  (can-place-peg mid d3)  (can-place-peg mid d4)
    (can-place-peg right d1) (can-place-peg right d2) (can-place-peg right d3) (can-place-peg right d4)

    ;; Disks accept only strictly smaller disks on top
    ;; can-place-disk ?support ?d  is true iff (smaller ?d ?support)
    (can-place-disk d2 d1)
    (can-place-disk d3 d1) (can-place-disk d3 d2)
    (can-place-disk d4 d1) (can-place-disk d4 d2) (can-place-disk d4 d3)

    ;; Explicitly state negative facts required by :negative-preconditions usage where useful:
    ;; (These are written as explicit negative literals using the domain predicates where needed.)
    ;; The initial negative facts are expressed by omission of the corresponding positive atoms above.
    ;; For clarity: ensure other disks are not marked top
    (not (top d2)) (not (top d3)) (not (top d4))

    ;; ensure left peg not empty explicitly above; mid and right empty already true
    ;; ensure no other on-peg/on-disk facts except those given (omitted)
  )

  (:goal (and
    ;; Final stack must be entirely on the right peg in correct order:
    ;; bottom d4 on right, then d3 on d4, d2 on d3, d1 on d2 (d1 top)
    (on-peg d4 right)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (top d1)

    ;; Middle peg must be empty at the end
    (empty mid)

    ;; As part of "move stack from left to right", left should be empty
    (empty left)
  ))
)