(define (problem hanoi-4-disks-multiagent)
  (:domain hanoi-multiagent)

  (:objects
    ;; pegs
    left middle right - peg

    ;; disks (disk names from smallest d1 to largest d4)
    d1 d2 d3 d4 - disk

    ;; steps for the required move sequence: s1 .. s15
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step

    ;; declare that disks and pegs are places by treating disk and peg objects as places where needed
    ;; (PDDL typing lets us use disk and peg where place is expected).
  )

  (:init
    ;; Size ordering (strict)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; Initial stacking: all disks on the right peg.
    ;; Representation: on ?disk ?place where place is a peg or another disk.
    ;; Bottom disk d4 on right peg, d3 on d4, d2 on d3, d1 on d2 (d1 is top).
    (on d4 right)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; Clear/top facts: places with nothing on top are clear.
    ;; Initially: left and middle pegs empty (clear), d1 is top and clear.
    (clear left)
    (clear middle)
    (clear d1)

    ;; step sequencing: explicit successor chain and last-step marker
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

    ;; start with step 1 active
    (current-step s1)

    ;; --- REQUIRED move sequence (strictly enforced per-step) ---
    ;; The 15-move minimal solution to move 4 disks from right -> middle using left as auxiliary.
    ;; For each step s, specify the required disk, source (place) and target (place).
    ;; Step-by-step (disk numbering: d1 smallest, d4 largest):
    ;; Moves:
    ;; 1: d1 right -> left
    ;; 2: d2 right -> middle
    ;; 3: d1 left  -> middle
    ;; 4: d3 right -> left
    ;; 5: d1 middle-> right
    ;; 6: d2 middle-> left
    ;; 7: d1 right -> left
    ;; 8: d4 right -> middle
    ;; 9: d1 left  -> middle
    ;; 10: d2 left -> right
    ;; 11: d1 middle -> right
    ;; 12: d3 left -> middle
    ;; 13: d1 right -> left
    ;; 14: d2 right -> middle
    ;; 15: d1 left -> middle

    (required-disk s1 d1)
    (required-from s1 right)
    (required-to   s1 left)

    (required-disk s2 d2)
    (required-from s2 right)
    (required-to   s2 middle)

    (required-disk s3 d1)
    (required-from s3 left)
    (required-to   s3 middle)

    (required-disk s4 d3)
    (required-from s4 right)
    (required-to   s4 left)

    (required-disk s5 d1)
    (required-from s5 middle)
    (required-to   s5 right)

    (required-disk s6 d2)
    (required-from s6 middle)
    (required-to   s6 left)

    (required-disk s7 d1)
    (required-from s7 right)
    (required-to   s7 left)

    (required-disk s8 d4)
    (required-from s8 right)
    (required-to   s8 middle)

    (required-disk s9 d1)
    (required-from s9 left)
    (required-to   s9 middle)

    (required-disk s10 d2)
    (required-from s10 left)
    (required-to   s10 right)

    (required-disk s11 d1)
    (required-from s11 middle)
    (required-to   s11 right)

    (required-disk s12 d3)
    (required-from s12 left)
    (required-to   s12 middle)

    (required-disk s13 d1)
    (required-from s13 right)
    (required-to   s13 left)

    (required-disk s14 d2)
    (required-from s14 right)
    (required-to   s14 middle)

    (required-disk s15 d1)
    (required-from s15 left)
    (required-to   s15 middle)
    ;; --- end required sequence ---
  )

  (:goal
    (and
      ;; final stack: all disks must be on the middle peg in correct order:
      ;; bottom d4 on middle, d3 on d4, d2 on d3, d1 on d2
      (on d4 middle)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)

      ;; auditor must have produced the report confirming the whole ordered sequence
      (audited)
    )
  )
)