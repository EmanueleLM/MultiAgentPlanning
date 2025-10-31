(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 d5 - disk
    pegA pegB pegC - peg
  )

  (:init
    ;; initial stack on pegA: d5 bottom, then d4, d3, d2, d1 top
    (on-peg d5 pegA)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; clear markers
    (clear d1)
    ;; other disks not listed as clear imply not clear (they have disks above)
    (clear-peg pegB)
    (clear-peg pegC)
    ;; pegA initially not clear (has disks)

    ;; size ordering: bigger di dj when i>j
    (bigger d2 d1)
    (bigger d3 d1) (bigger d3 d2)
    (bigger d4 d1) (bigger d4 d2) (bigger d4 d3)
    (bigger d5 d1) (bigger d5 d2) (bigger d5 d3) (bigger d5 d4)
  )

  (:goal (and
    ;; all disks replicated on pegC in the same order: d5 bottom ... d1 top
    (on-peg d5 pegC)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (clear d1)
  ))
)