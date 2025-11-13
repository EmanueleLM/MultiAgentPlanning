(define (problem hanoi-3peg-20disks)
  (:domain hanoi-3peg)

  (:objects
    d01 d02 d03 d04 d05 d06 d07 d08 d09 d10
    d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 - disk
    peg-a peg-b peg-c - peg
  )

  (:init
    ; Size ordering: d01 is smallest, d20 is largest
    (smaller d01 d02) (smaller d01 d03) (smaller d01 d04) (smaller d01 d05) (smaller d01 d06)
    (smaller d01 d07) (smaller d01 d08) (smaller d01 d09) (smaller d01 d10) (smaller d01 d11)
    (smaller d01 d12) (smaller d01 d13) (smaller d01 d14) (smaller d01 d15) (smaller d01 d16)
    (smaller d01 d17) (smaller d01 d18) (smaller d01 d19) (smaller d01 d20)

    (smaller d02 d03) (smaller d02 d04) (smaller d02 d05) (smaller d02 d06) (smaller d02 d07)
    (smaller d02 d08) (smaller d02 d09) (smaller d02 d10) (smaller d02 d11) (smaller d02 d12)
    (smaller d02 d13) (smaller d02 d14) (smaller d02 d15) (smaller d02 d16) (smaller d02 d17)
    (smaller d02 d18) (smaller d02 d19) (smaller d02 d20)

    (smaller d03 d04) (smaller d03 d05) (smaller d03 d06) (smaller d03 d07) (smaller d03 d08)
    (smaller d03 d09) (smaller d03 d10) (smaller d03 d11) (smaller d03 d12) (smaller d03 d13)
    (smaller d03 d14) (smaller d03 d15) (smaller d03 d16) (smaller d03 d17) (smaller d03 d18)
    (smaller d03 d19) (smaller d03 d20)

    (smaller d04 d05) (smaller d04 d06) (smaller d04 d07) (smaller d04 d08) (smaller d04 d09)
    (smaller d04 d10) (smaller d04 d11) (smaller d04 d12) (smaller d04 d13) (smaller d04 d14)
    (smaller d04 d15) (smaller d04 d16) (smaller d04 d17) (smaller d04 d18) (smaller d04 d19)
    (smaller d04 d20)

    (smaller d05 d06) (smaller d05 d07) (smaller d05 d08) (smaller d05 d09) (smaller d05 d10)
    (smaller d05 d11) (smaller d05 d12) (smaller d05 d13) (smaller d05 d14) (smaller d05 d15)
    (smaller d05 d16) (smaller d05 d17) (smaller d05 d18) (smaller d05 d19) (smaller d05 d20)

    (smaller d06 d07) (smaller d06 d08) (smaller d06 d09) (smaller d06 d10) (smaller d06 d11)
    (smaller d06 d12) (smaller d06 d13) (smaller d06 d14) (smaller d06 d15) (smaller d06 d16)
    (smaller d06 d17) (smaller d06 d18) (smaller d06 d19) (smaller d06 d20)

    (smaller d07 d08) (smaller d07 d09) (smaller d07 d10) (smaller d07 d11) (smaller d07 d12)
    (smaller d07 d13) (smaller d07 d14) (smaller d07 d15) (smaller d07 d16) (smaller d07 d17)
    (smaller d07 d18) (smaller d07 d19) (smaller d07 d20)

    (smaller d08 d09) (smaller d08 d10) (smaller d08 d11) (smaller d08 d12) (smaller d08 d13)
    (smaller d08 d14) (smaller d08 d15) (smaller d08 d16) (smaller d08 d17) (smaller d08 d18)
    (smaller d08 d19) (smaller d08 d20)

    (smaller d09 d10) (smaller d09 d11) (smaller d09 d12) (smaller d09 d13) (smaller d09 d14)
    (smaller d09 d15) (smaller d09 d16) (smaller d09 d17) (smaller d09 d18) (smaller d09 d19)
    (smaller d09 d20)

    (smaller d10 d11) (smaller d10 d12) (smaller d10 d13) (smaller d10 d14) (smaller d10 d15)
    (smaller d10 d16) (smaller d10 d17) (smaller d10 d18) (smaller d10 d19) (smaller d10 d20)

    (smaller d11 d12) (smaller d11 d13) (smaller d11 d14) (smaller d11 d15) (smaller d11 d16)
    (smaller d11 d17) (smaller d11 d18) (smaller d11 d19) (smaller d11 d20)

    (smaller d12 d13) (smaller d12 d14) (smaller d12 d15) (smaller d12 d16) (smaller d12 d17)
    (smaller d12 d18) (smaller d12 d19) (smaller d12 d20)

    (smaller d13 d14) (smaller d13 d15) (smaller d13 d16) (smaller d13 d17) (smaller d13 d18)
    (smaller d13 d19) (smaller d13 d20)

    (smaller d14 d15) (smaller d14 d16) (smaller d14 d17) (smaller d14 d18) (smaller d14 d19)
    (smaller d14 d20)

    (smaller d15 d16) (smaller d15 d17) (smaller d15 d18) (smaller d15 d19) (smaller d15 d20)

    (smaller d16 d17) (smaller d16 d18) (smaller d16 d19) (smaller d16 d20)

    (smaller d17 d18) (smaller d17 d19) (smaller d17 d20)

    (smaller d18 d19) (smaller d18 d20)

    (smaller d19 d20)

    ; Initial stack: all disks on peg-a, smallest on top (d01 on d02 on ... on d20 on peg-a)
    (on-disk d01 d02)
    (on-disk d02 d03)
    (on-disk d03 d04)
    (on-disk d04 d05)
    (on-disk d05 d06)
    (on-disk d06 d07)
    (on-disk d07 d08)
    (on-disk d08 d09)
    (on-disk d09 d10)
    (on-disk d10 d11)
    (on-disk d11 d12)
    (on-disk d12 d13)
    (on-disk d13 d14)
    (on-disk d14 d15)
    (on-disk d15 d16)
    (on-disk d16 d17)
    (on-disk d17 d18)
    (on-disk d18 d19)
    (on-disk d19 d20)
    (on-peg d20 peg-a)

    ; Clear/top indicators
    (clear-disk d01)
    (clear-peg peg-b)
    (clear-peg peg-c)
    ; peg-a is not clear initially (implicit)
  )

  ; Goal: all disks stacked on peg-c in order; other pegs clear; top disk clear
  (:goal (and
    (on-disk d01 d02)
    (on-disk d02 d03)
    (on-disk d03 d04)
    (on-disk d04 d05)
    (on-disk d05 d06)
    (on-disk d06 d07)
    (on-disk d07 d08)
    (on-disk d08 d09)
    (on-disk d09 d10)
    (on-disk d10 d11)
    (on-disk d11 d12)
    (on-disk d12 d13)
    (on-disk d13 d14)
    (on-disk d14 d15)
    (on-disk d15 d16)
    (on-disk d16 d17)
    (on-disk d17 d18)
    (on-disk d18 d19)
    (on-disk d19 d20)
    (on-peg d20 peg-c)
    (clear-peg peg-a)
    (clear-peg peg-b)
    (clear-disk d01)
  ))
)