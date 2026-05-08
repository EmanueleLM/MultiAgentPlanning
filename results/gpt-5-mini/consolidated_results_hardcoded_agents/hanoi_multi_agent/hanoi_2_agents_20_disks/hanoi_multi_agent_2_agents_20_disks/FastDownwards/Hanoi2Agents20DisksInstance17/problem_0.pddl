(define (problem hanoi_agents_inst)
  (:domain hanoi_agents)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 - disk
    left middle right - peg
    left middle right d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 - object
  )

  (:init
    ;; Initial stacking for the five small disks on the left: d1 on d2 on d3 on d4 on d5 on left
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 left)

    ;; Larger disks already stacked on the right (d6 is top of that larger stack)
    (on d6 d7)
    (on d7 d8)
    (on d8 d9)
    (on d9 d10)
    (on d10 d11)
    (on d11 d12)
    (on d12 d13)
    (on d13 d14)
    (on d14 d15)
    (on d15 d16)
    (on d16 d17)
    (on d17 d18)
    (on d18 d19)
    (on d19 d20)
    (on d20 right)

    ;; Clear/top markers initially
    (clear d1)
    (clear d6)

    ;; Peg emptiness
    (clear-peg middle)

    ;; Size ordering: smaller di dj for i < j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7) (smaller d1 d8) (smaller d1 d9) (smaller d1 d10) (smaller d1 d11) (smaller d1 d12) (smaller d1 d13) (smaller d1 d14) (smaller d1 d15) (smaller d1 d16) (smaller d1 d17) (smaller d1 d18) (smaller d1 d19) (smaller d1 d20)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7) (smaller d2 d8) (smaller d2 d9) (smaller d2 d10) (smaller d2 d11) (smaller d2 d12) (smaller d2 d13) (smaller d2 d14) (smaller d2 d15) (smaller d2 d16) (smaller d2 d17) (smaller d2 d18) (smaller d2 d19) (smaller d2 d20)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7) (smaller d3 d8) (smaller d3 d9) (smaller d3 d10) (smaller d3 d11) (smaller d3 d12) (smaller d3 d13) (smaller d3 d14) (smaller d3 d15) (smaller d3 d16) (smaller d3 d17) (smaller d3 d18) (smaller d3 d19) (smaller d3 d20)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7) (smaller d4 d8) (smaller d4 d9) (smaller d4 d10) (smaller d4 d11) (smaller d4 d12) (smaller d4 d13) (smaller d4 d14) (smaller d4 d15) (smaller d4 d16) (smaller d4 d17) (smaller d4 d18) (smaller d4 d19) (smaller d4 d20)
    (smaller d5 d6) (smaller d5 d7) (smaller d5 d8) (smaller d5 d9) (smaller d5 d10) (smaller d5 d11) (smaller d5 d12) (smaller d5 d13) (smaller d5 d14) (smaller d5 d15) (smaller d5 d16) (smaller d5 d17) (smaller d5 d18) (smaller d5 d19) (smaller d5 d20)
    (smaller d6 d7) (smaller d6 d8) (smaller d6 d9) (smaller d6 d10) (smaller d6 d11) (smaller d6 d12) (smaller d6 d13) (smaller d6 d14) (smaller d6 d15) (smaller d6 d16) (smaller d6 d17) (smaller d6 d18) (smaller d6 d19) (smaller d6 d20)
    (smaller d7 d8) (smaller d7 d9) (smaller d7 d10) (smaller d7 d11) (smaller d7 d12) (smaller d7 d13) (smaller d7 d14) (smaller d7 d15) (smaller d7 d16) (smaller d7 d17) (smaller d7 d18) (smaller d7 d19) (smaller d7 d20)
    (smaller d8 d9) (smaller d8 d10) (smaller d8 d11) (smaller d8 d12) (smaller d8 d13) (smaller d8 d14) (smaller d8 d15) (smaller d8 d16) (smaller d8 d17) (smaller d8 d18) (smaller d8 d19) (smaller d8 d20)
    (smaller d9 d10) (smaller d9 d11) (smaller d9 d12) (smaller d9 d13) (smaller d9 d14) (smaller d9 d15) (smaller d9 d16) (smaller d9 d17) (smaller d9 d18) (smaller d9 d19) (smaller d9 d20)
    (smaller d10 d11) (smaller d10 d12) (smaller d10 d13) (smaller d10 d14) (smaller d10 d15) (smaller d10 d16) (smaller d10 d17) (smaller d10 d18) (smaller d10 d19) (smaller d10 d20)
    (smaller d11 d12) (smaller d11 d13) (smaller d11 d14) (smaller d11 d15) (smaller d11 d16) (smaller d11 d17) (smaller d11 d18) (smaller d11 d19) (smaller d11 d20)
    (smaller d12 d13) (smaller d12 d14) (smaller d12 d15) (smaller d12 d16) (smaller d12 d17) (smaller d12 d18) (smaller d12 d19) (smaller d12 d20)
    (smaller d13 d14) (smaller d13 d15) (smaller d13 d16) (smaller d13 d17) (smaller d13 d18) (smaller d13 d19) (smaller d13 d20)
    (smaller d14 d15) (smaller d14 d16) (smaller d14 d17) (smaller d14 d18) (smaller d14 d19) (smaller d14 d20)
    (smaller d15 d16) (smaller d15 d17) (smaller d15 d18) (smaller d15 d19) (smaller d15 d20)
    (smaller d16 d17) (smaller d16 d18) (smaller d16 d19) (smaller d16 d20)
    (smaller d17 d18) (smaller d17 d19) (smaller d17 d20)
    (smaller d18 d19) (smaller d18 d20)
    (smaller d19 d20)
  )

  (:goal (and
    ;; Final arrangement derived from the integrated move sequence:
    ;; d1 on d2, d2 on d3, d3 placed on the larger-stack top d6 (so d3 on d6),
    ;; larger stack d6..d20 remains on right, d4 on left, d5 on middle
    (on d1 d2)
    (on d2 d3)
    (on d3 d6)

    (on d6 d7)
    (on d7 d8)
    (on d8 d9)
    (on d9 d10)
    (on d10 d11)
    (on d11 d12)
    (on d12 d13)
    (on d13 d14)
    (on d14 d15)
    (on d15 d16)
    (on d16 d17)
    (on d17 d18)
    (on d18 d19)
    (on d19 d20)
    (on d20 right)

    (on d4 left)
    (on d5 middle)
  ))
)