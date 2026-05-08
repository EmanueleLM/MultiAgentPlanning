(define (problem hanoi-6-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    ;; disks: d1 = smallest (A), ... , d6 = largest (F)
    d1 d2 d3 d4 d5 d6 - disk
    left middle right - peg
  )

  (:init
    ;; initial tower on right peg, top-to-bottom: d1, d2, d3, d4, d5, d6
    ;; representation: top relations + chain of on-disk for direct-above relations, and on-peg for bottom-most
    (top d1 right)
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-disk d4 d5)
    (on-disk d5 d6)
    (on-peg d6 right)

    ;; left and middle pegs empty initially
    (empty left)
    (empty middle)

    ;; static size ordering: d1 < d2 < ... < d6 (only the necessary 15 pair facts)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal
    (and
      ;; final tower on middle peg, top-to-bottom: d1, d2, d3, d4, d5, d6
      (top d1 middle)
      (on-disk d1 d2)
      (on-disk d2 d3)
      (on-disk d3 d4)
      (on-disk d4 d5)
      (on-disk d5 d6)
      (on-peg d6 middle)

      ;; left and right pegs must be empty at the end
      (empty left)
      (empty right)
    )
  )
)