(define (problem hanoi-4-to-mid-with-stages)
  (:domain hanoi-explicit-time)
  (:objects
    A B C D - disk
    left mid right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Disk size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; Initial stack on left peg: top A, then B, then C, then D (bottom)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    ;; Top and empty bookkeeping
    (top left A)
    (empty mid)
    (empty right)

    ;; Stage objects and successor chain (discrete time steps)
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4)
    (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Start at stage s0
    (current s0)
  )

  (:goal (and
    ;; Goal must hold at final stage s15 (enforced by current s15)
    (current s15)

    ;; Middle peg holds A (top), B, C, D (bottom)
    (top mid A)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D mid)

    ;; Left and right pegs empty
    (empty left)
    (empty right)
  ))
)