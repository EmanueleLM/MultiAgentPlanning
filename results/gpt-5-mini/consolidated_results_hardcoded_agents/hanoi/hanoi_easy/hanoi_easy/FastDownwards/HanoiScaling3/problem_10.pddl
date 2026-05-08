(define (problem hanoi-4-3)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
    ;; pegs and disks are also 'object' by typing hierarchy (disk and peg are subtypes of object)
  )
  (:init
    ;; temporal stages: start at s0, must reach s15; actions must consume consecutive stages
    (current s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; initial tower on left: top A on B on C on D on left
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; which objects are clear initially: top disk and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; static size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; full tower on right: A on B on C on D on right
    (on A B)
    (on B C)
    (on C D)
    (on D right)
    ;; left and middle pegs must be empty at goal
    (clear left)
    (clear middle)
    ;; reach terminal stage (enforces the plan length is exactly the number of stage steps provided)
    (current s15)
  ))
)