(define (problem hanoi-4-disks-left-to-right)
  (:domain hanoi)

  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; stages and ordering (15 moves require 16 stages s0..s15)
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4)
    (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)
    (current s0)

    ;; initial tower on left peg: bottom d on left, then c on d, then b on c, then a on b
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; top/empty flags: only top-most disk a is clear; middle and right pegs empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering (static): a < b < c < d
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; All disks stacked on the right peg (from bottom to top: d, c, b, a)
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; Hard constraint: left and middle pegs empty in final state
    (clear-peg left)
    (clear-peg middle)

    ;; Terminal stage reached exactly after the plan
    (current s15)
  ))