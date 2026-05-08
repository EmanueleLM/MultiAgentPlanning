(define (problem hanoi-4)
  (:domain tower-of-hanoi)
  (:objects
    ;; disks: a smallest .. d largest
    a b c d - disk

    left middle right - peg

    ;; explicit ordered stages: need 16 stages to allow up to 15 moves (2^4 - 1)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; initial stack is on the middle peg from bottom to top: d (bottom), c, b, a (top)
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; peg clearness: left and right empty, middle not empty
    (clear-peg left)
    (clear-peg right)
    ;; middle has disks, so not clear: do not assert (clear-peg middle)

    ;; clear-disk: only topmost disk a is clear initially
    (clear-disk a)
    ;; b, c, d have disks on top, so not clear: do not assert clear-disk b/c/d

    ;; size ordering facts (smaller)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)

    ;; step ordering
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; start at s0
    (current s0)
  )

  (:goal (and
    ;; final stack on left peg bottom-to-top: d, c, b, a
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; middle and right pegs empty (as required)
    (clear-peg middle)
    (clear-peg right)
  ))
)