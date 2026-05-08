(define (problem hanoi-7)
  (:domain hanoi)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 - disk
    left mid right - peg
  )

  (:init
    ;; Initial stacking: all disks on the middle peg 'mid' with d1 smallest on top, d7 largest on peg
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-disk d4 d5)
    (on-disk d5 d6)
    (on-disk d6 d7)
    (on-peg d7 mid)

    ;; Only the smallest disk d1 is the top of the initial stack
    (top d1)

    ;; Peg occupancy: left and right start empty, middle not empty
    (empty left)
    (empty right)
    ;; (mid is not empty; no (empty mid) fact)

    ;; Disk size ordering: smaller relations for all pairs where the first is strictly smaller
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7)
    (smaller d5 d6) (smaller d5 d7)
    (smaller d6 d7)
  )

  (:goal (and
    ;; All disks stacked on the right peg 'right' with correct ordering:
    ;; largest directly on the peg, each smaller disk directly on the next larger
    (on-peg d7 right)
    (on-disk d6 d7)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; Left peg must be empty at the end (explicit hard constraint)
    (empty left)

    ;; Middle peg must be empty as well because all disks are on the right
    (empty mid)
  ))
)