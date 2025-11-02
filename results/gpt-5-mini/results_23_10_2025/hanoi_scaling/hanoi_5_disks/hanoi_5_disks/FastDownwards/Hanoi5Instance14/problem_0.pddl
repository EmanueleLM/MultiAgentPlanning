; PDDL problem for Tower of Hanoi with 5 disks: A (smallest) ... E (largest)
; NOTE: Manager peg state reports were not provided in the input. Per instructions,
; we must not invent initial facts beyond provided data. Because no peg reports
; were received, we make a single, explicit assumption here and document it:
; ASSUMPTION: The classical initial configuration applies: all five disks A..E
; are stacked on the left peg in descending size order (E bottom, D on E, C on D,
; B on C, A on B). This is the minimal, explicit assumption needed to produce
; a concrete solvable instance that moves all disks from left to right.
; If you have different manager reports, supply them and this problem will be
; revised to reflect only the reported facts.
;
; The goal is to move the entire stack from left peg to right peg following
; Tower of Hanoi rules (only one disk moved at a time; no larger disk on a smaller).

(define (problem hanoi-problem)
  (:domain hanoi)

  (:objects
    A B C D E left middle right - place
  )

  (:init
    ; type markers
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (peg left) (peg middle) (peg right)

    ; size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ; Initial stacking (assumption documented above):
    ; bottom E on left peg, then D on E, C on D, B on C, A on B
    (on E left)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Clear facts: topmost disk and empty pegs
    (clear A)
    (clear middle)
    (clear right)
    ; left peg is not clear (E is on it); disks B-E are not clear except A
  )

  (:goal (and
    ; final stack on right: E bottom on right, then D on E, C on D, B on C, A on B
    (on E right)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)