(define (problem hanoi-3disk-instance)
  (:domain hanoi)
  (:objects
    d1 d2 d3 - disk
    pegA pegB pegC - peg
    s1 s2 s3 s4 s5 s6 s7 s8 - step
  )

  (:init
    ;; initial placement: all disks on pegA in order (d1 is smallest, on top)
    (on d1 pegA)
    (on d2 pegA)
    (on d3 pegA)
    ;; direct above links (d1 above d2, d2 above d3)
    (above d1 d2)
    (above d2 d3)
    ;; top pointers and empty peg flags
    (top pegA d1)
    (empty pegB)
    (empty pegC)
    ;; initial step marker
    (at-step s1)
    ;; step successor chain enforces the validated sequence order
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8)
  )

  ;; goal enforces final required terminal state: all disks on pegC
  ;; stacked in correct order with d1 top, and that the final step marker
  ;; was reached (ensures all step actions were executed in order).
  (:goal (and
    (on d1 pegC) (on d2 pegC) (on d3 pegC)
    (above d1 d2) (above d2 d3)
    (top pegC d1)
    (at-step s8)
  ))
)