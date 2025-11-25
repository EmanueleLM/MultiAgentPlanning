(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)

  (:objects
    ;; places: five disks and three pegs (all declared as places)
    d1 d2 d3 d4 d5 p1 p2 p3 - place

    ;; two agents are present; actions are parameterized by agent but no further agent constraints are imposed
    a1 a2 - agent
  )

  (:init
    ;; identify disks and pegs
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5)
    (peg p1) (peg p2) (peg p3)

    ;; initial stack on source peg p1:
    ;; bottom: d5 on p1, then d4 on d5, d3 on d4, d2 on d3, d1 on d2 (d1 is top)
    (on d5 p1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; clear = true only for top-of-stack places (d1) and empty pegs p2,p3
    (clear d1)
    (clear p2)
    (clear p3)

    ;; ordering (static) -- smaller means the first argument is strictly smaller than the second
    ;; d1 smallest, then d2, d3, d4, d5 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal
    (and
      ;; final stack on target peg p3 must be in the same correct order:
      ;; bottom: d5 on p3, then d4 on d5, d3 on d4, d2 on d3, d1 on d2
      (on d5 p3)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
      ;; explicit terminal condition: ensure top disk is clear (top remains clear)
      (clear d1)
    )
  )
)