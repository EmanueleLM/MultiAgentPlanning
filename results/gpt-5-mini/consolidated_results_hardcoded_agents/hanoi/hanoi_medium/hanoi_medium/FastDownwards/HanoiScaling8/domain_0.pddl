(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg step agent)

  (:predicates
    (on ?d - disk ?p - peg)                     ; disk ?d is on peg ?p
    (expected ?s - step ?d - disk ?from - peg ?to - peg) ; expected move at step ?s: move ?d from ?from to ?to
    (step-current ?s - step)                   ; which step is current (enforces ordering)
    (moved ?s - step)                          ; mover has executed the move for step ?s (awaiting audit)
    (audited ?s - step)                        ; auditor has verified step ?s
    (next ?s1 - step ?s2 - step)               ; successor step relation (enforces contiguity)
    (agent ?a - agent)                         ; agent identity (to separate responsibilities)
  )

  ; MOVES: one action per disk size to allow explicit negative preconditions enumerating smaller disks.
  ; Each move action:
  ;  - may execute only when its step is current and the expected mapping matches
  ;  - requires the moving disk to be on the source peg
  ;  - requires that no smaller disk is present on the source peg (so the disk is top)
  ;  - requires that no smaller disk is present on the target peg (so not placing a larger on smaller)
  ;  - requires that the step has not yet been moved
  ;  - requires the mover agent to be present (separates responsibilities)
  ; Effects:
  ;  - relocate exactly the single disk
  ;  - mark the step as moved (auditor must then audit before next step)

  (:action move-a
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s a ?from ?to)
                    (on a ?from)
                    (not (moved ?s))
                    (agent mover)
                  )
    :effect (and
              (not (on a ?from))
              (on a ?to)
              (moved ?s)
            )
  )

  (:action move-b
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s b ?from ?to)
                    (on b ?from)
                    ; ensure b is top on source: no smaller disk a on source
                    (not (on a ?from))
                    ; ensure target does not have a smaller disk (would be illegal to place b on a)
                    (not (on a ?to))
                    (not (moved ?s))
                    (agent mover)
                  )
    :effect (and
              (not (on b ?from))
              (on b ?to)
              (moved ?s)
            )
  )

  (:action move-c
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s c ?from ?to)
                    (on c ?from)
                    ; ensure c is top on source: no a or b on source
                    (not (on a ?from))
                    (not (on b ?from))
                    ; ensure target does not have smaller disks a or b
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (moved ?s))
                    (agent mover)
                  )
    :effect (and
              (not (on c ?from))
              (on c ?to)
              (moved ?s)
            )
  )

  (:action move-d
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s d ?from ?to)
                    (on d ?from)
                    ; ensure d is top on source: no a, b, c on source
                    (not (on a ?from))
                    (not (on b ?from))
                    (not (on c ?from))
                    ; ensure target has no smaller disk a, b, or c
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (on c ?to))
                    (not (moved ?s))
                    (agent mover)
                  )
    :effect (and
              (not (on d ?from))
              (on d ?to)
              (moved ?s)
            )
  )

  (:action move-e
    :parameters (?s - step ?from - peg ?to - peg)
    :precondition (and
                    (step-current ?s)
                    (expected ?s e ?from ?to)
                    (on e ?from)
                    ; ensure e is top on source: no a, b, c, d on source
                    (not (on a ?from))
                    (not (on b ?from))
                    (not (on c ?from))
                    (not (on d ?from))
                    ; ensure target has no smaller disk a, b, c, or d
                    (not (on a ?to))
                    (not (on b ?to))
                    (not (on c ?to))
                    (not (on d ?to))
                    (not (moved ?s))
                    (agent mover)
                  )
    :effect (and
              (not (on e ?from))
              (on e ?to)
              (moved ?s)
            )
  )

  ; AUDITOR: must verify the move before next step may begin.
  ; The auditor action:
  ;  - requires that the step is current and has been moved, and has not yet been audited
  ;  - moves the step-current marker to the successor step
  ;  - marks the step as audited
  ;  - clears the moved marker for that step (bookkeeping)
  (:action audit-step
    :parameters (?s - step ?next - step)
    :precondition (and
                    (step-current ?s)
                    (moved ?s)
                    (next ?s ?next)
                    (not (audited ?s))
                    (agent auditor)
                  )
    :effect (and
              (audited ?s)
              (not (step-current ?s))
              (step-current ?next)
              (not (moved ?s))
            )
  )
)