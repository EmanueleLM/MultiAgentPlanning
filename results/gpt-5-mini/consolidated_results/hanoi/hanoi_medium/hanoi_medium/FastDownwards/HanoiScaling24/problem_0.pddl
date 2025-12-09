; Problem: Tower of Hanoi with 5 disks
; Orchestrator instantiates the integrated domain for the 5-disk puzzle.
; Disks provided by disk_manager; legal moves provided by move_planner; auditor requirements encoded as state predicates.

(define (problem hanoi-5-disks)
  (:domain hanoi-orchestrator)

  ;; Objects
  (:objects
    d1 d2 d3 d4 d5 - disk
    pegA pegB pegC - place
  )

  ;; Initial state:
  ;; Stack on pegA: top d1 on d2, d2 on d3, d3 on d4, d4 on d5, d5 on pegA
  ;; pegB and pegC are empty (clear)
  ;; clear facts: top disk of stack (d1) is clear; other disks are not clear; pegA is not clear
  ;; Static size ordering (disk_manager): d1 < d2 < d3 < d4 < d5 (transitively enumerated as pairwise smaller facts)
  (:init
    ; initial on-relations (stacked on pegA)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 pegA)

    ; clear facts
    (clear d1)    ; top disk has nothing on top
    ; disks d2..d5 are not declared clear (so they are not clear)
    (not (clear d2)) ; NOTE: explicit negative initial literals are not standard in some PDDL versions;
                      ; however we avoid relying on them except for clarity here. FastDownward ignores negative in :init,
                      ; so we will rely on the absence of (clear d2) etc. The explicit not(...) lines are comments for readers.
    (not (clear d3))
    (not (clear d4))
    (not (clear d5))
    (not (clear pegA)) ; pegA has disks, so not clear
    (clear pegB)
    (clear pegC)

    ; static size relations (disk_manager)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d1 d5)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d2 d5)
    (smaller d3 d4)
    (smaller d3 d5)
    (smaller d4 d5)
  )

  ;; Goal: move the entire tower from pegA to pegC preserving stack order.
  ;; The goal requires the same stacked configuration on pegC and that pegA and pegB be clear.
  ;; This fixes every mandated terminal condition: exact final locations and the pegs' emptiness.
  (:goal
    (and
      ; stacked on pegC in identical ordering (d1 top, d5 bottom)
      (on d1 d2)
      (on d2 d3)
      (on d3 d4)
      (on d4 d5)
      (on d5 pegC)

      ; pegs A and B must be empty at the end (auditor requirement encoded as hard constraint)
      (clear pegA)
      (clear pegB)

      ; top disk remains clear
      (clear d1)
    )
  )

  ;; Note: No metric or cost used. All preferences are encoded as hard constraints.
)