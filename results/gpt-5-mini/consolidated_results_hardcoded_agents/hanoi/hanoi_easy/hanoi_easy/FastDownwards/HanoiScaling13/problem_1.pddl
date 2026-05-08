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

    ;; step sequencing
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
    ;; 1: d1 right -> left
    (required-disk s1 d1)
    (required-from s1 right)
    (required-to   s1 left)

    ;; 2: d2 right -> middle
    (required-disk s2 d2)
    (required-from s2 right)
    (required-to   s2 middle)

    ;; 3: d1 left -> middle
    (required-disk s3 d1)
    (required-from s3 left)
    (required-to   s3 middle)

    ;; 4: d3 right -> left
    (required-disk s4 d3)
    (required-from s4 right)
    (required-to   s4 left)

    ;; 5: d1 middle -> right
    (required-disk s5 d1)
    (required-from s5 middle)
    (required-to   s5 right)

    ;; 6: d2 middle -> left
    (required-disk s6 d2)
    (required-from s6 middle)
    (required-to   s6 left)

    ;; 7: d1 right -> left
    (required-disk s7 d1)
    (required-from s7 right)
    (required-to   s7 left)

    ;; 8: d4 right -> middle
    (required-disk s8 d4)
    (required-from s8 right)
    (required-to   s8 middle)

    ;; 9: d1 left -> middle
    (required-disk s9 d1)
    (required-from s9 left)
    (required-to   s9 middle)

    ;; 10: d2 left -> right
    (required-disk s10 d2)
    (required-from s10 left)
    (required-to   s10 right)

    ;; 11: d1 middle -> right
    (required-disk s11 d1)
    (required-from s11 middle)
    (required-to   s11 right)

    ;; 12: d3 left -> middle
    (required-disk s12 d3)
    (required-from s12 left)
    (required-to   s12 middle)

    ;; 13: d1 right -> left
    (required-disk s13 d1)
    (required-from s13 right)
    (required-to   s13 left)

    ;; 14: d2 right -> middle
    (required-disk s14 d2)
    (required-from s14 right)
    (required-to   s14 middle)

    ;; 15: d1 left -> middle
    (required-disk s15 d1)
    (required-from s15 left)
    (required-to   s15 middle)
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