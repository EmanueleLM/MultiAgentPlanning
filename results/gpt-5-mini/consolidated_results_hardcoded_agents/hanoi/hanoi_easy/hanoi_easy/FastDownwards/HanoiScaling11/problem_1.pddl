(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ; size ordering (smaller X Y means X may be placed on Y)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ; initial positions: A on B, B on C, C on D, D on middle peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D middle)

    ; top-of-peg facts: A is the top disk on the middle peg
    (top A middle)

    ; empty pegs: left and right are empty initially
    (empty left)
    (empty right)

    ; stage succession chain to enforce exactly 15 moves (optimal for 4 disks)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ; starting stage
    (current s0)
  )

  (:goal (and
    ; all disks re-stacked on right in the same order (A on B, B on C, C on D, D on right)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)

    ; top-of-peg fact for right peg
    (top A right)

    ; other pegs empty
    (empty left)
    (empty middle)

    ; final stage reached after exactly 15 moves
    (current s15)
  ))