(define (problem hanoi-4-disks)
  (:domain hanoi)

  (:objects
    left middle right - peg
    d1 d2 d3 d4 - disk
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; size ordering (d1 smallest ... d4 largest)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; initial stack on right peg: bottom d4 on right, d3 on d4, d2 on d3, d1 on d2
    (on d4 right)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear places initially: left and middle pegs empty; top disk d1 has nothing on it
    (clear left)
    (clear middle)
    (clear d1)

    ;; step sequencing (15 moves)
    (step-successor s1 s2)
    (step-successor s2 s3)
    (step-successor s3 s4)
    (step-successor s4 s5)
    (step-successor s5 s6)
    (step-successor s6 s7)
    (step-successor s7 s8)
    (step-successor s8 s9)
    (step-successor s9 s10)
    (step-successor s10 s11)
    (step-successor s11 s12)
    (step-successor s12 s13)
    (step-successor s13 s14)
    (step-successor s14 s15)
    (last-step s15)

    (current-step s1)

    ;; required move sequence (15 moves) to move all disks right -> middle using left as auxiliary
    ;; The sequence follows the canonical 4-disk Hanoi solution:
    ;; 1: d1 right -> left
    (required-disk s1 d1)
    (required-from s1 right)
    (required-to   s1 left)

    ;; 2: d2 right -> middle
    (required-disk s2 d2)
    (required-from s2 right)
    (required-to   s2 middle)

    ;; 3: d1 left -> d2
    (required-disk s3 d1)
    (required-from s3 left)
    (required-to   s3 d2)

    ;; 4: d3 right -> left
    (required-disk s4 d3)
    (required-from s4 right)
    (required-to   s4 left)

    ;; 5: d1 middle -> d4
    (required-disk s5 d1)
    (required-from s5 middle)
    (required-to   s5 d4)

    ;; 6: d2 middle -> d3
    (required-disk s6 d2)
    (required-from s6 middle)
    (required-to   s6 d3)

    ;; 7: d1 right -> d2
    (required-disk s7 d1)
    (required-from s7 right)
    (required-to   s7 d2)

    ;; 8: d4 right -> middle
    (required-disk s8 d4)
    (required-from s8 right)
    (required-to   s8 middle)

    ;; 9: d1 left -> d4
    (required-disk s9 d1)
    (required-from s9 left)
    (required-to   s9 d4)

    ;; 10: d2 left -> right
    (required-disk s10 d2)
    (required-from s10 left)
    (required-to   s10 right)

    ;; 11: d1 middle -> d2
    (required-disk s11 d1)
    (required-from s11 middle)
    (required-to   s11 d2)

    ;; 12: d3 left -> d4
    (required-disk s12 d3)
    (required-from s12 left)
    (required-to   s12 d4)

    ;; 13: d1 right -> left
    (required-disk s13 d1)
    (required-from s13 right)
    (required-to   s13 left)

    ;; 14: d2 right -> d3
    (required-disk s14 d2)
    (required-from s14 right)
    (required-to   s14 d3)

    ;; 15: d1 left -> d2
    (required-disk s15 d1)
    (required-from s15 left)
    (required-to   s15 d2)

    ;; distinct facts to forbid no-op moves (place pairs where first != second)
    ;; places: left middle right d1 d2 d3 d4  => 7 objects -> 7*6 = 42 ordered distinct facts
    (distinct left middle) (distinct left right) (distinct left d1) (distinct left d2) (distinct left d3) (distinct left d4)
    (distinct middle left) (distinct middle right) (distinct middle d1) (distinct middle d2) (distinct middle d3) (distinct middle d4)
    (distinct right left) (distinct right middle) (distinct right d1) (distinct right d2) (distinct right d3) (distinct right d4)
    (distinct d1 left) (distinct d1 middle) (distinct d1 right) (distinct d1 d2) (distinct d1 d3) (distinct d1 d4)
    (distinct d2 left) (distinct d2 middle) (distinct d2 right) (distinct d2 d1) (distinct d2 d3) (distinct d2 d4)
    (distinct d3 left) (distinct d3 middle) (distinct d3 right) (distinct d3 d1) (distinct d3 d2) (distinct d3 d4)
    (distinct d4 left) (distinct d4 middle) (distinct d4 right) (distinct d4 d1) (distinct d4 d2) (distinct d4 d3)
  )

  (:goal
    (and
      ;; final stack on middle peg: bottom d4 on middle, d3 on d4, d2 on d3, d1 on d2
      (on d4 middle)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)

      ;; left and right pegs empty
      (clear left)
      (clear right)
    )
  )
)