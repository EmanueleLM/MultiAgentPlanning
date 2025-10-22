(define (problem hanoi-3)
  (:domain hanoi)
  (:objects
    left mid right - peg
    d1 d2 d3       - disk
  )
  (:init
    ;; initial stack: d3 on left, d2 on d3, d1 on d2 (d1 is smallest on top)
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-peg  d3 left)

    ;; clear predicates: only the top disk and empty pegs are clear
    (clear-disk d1)
    (clear-peg mid)
    (clear-peg right)

    ;; size ordering: d1 < d2 < d3
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)
  )
  (:goal (and
    ;; full stack moved intact to the right peg: d3 is on right, d2 on d3, d1 on d2
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-peg  d3 right)
  ))
)