(define (domain hanoi-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg slot step agent)

  (:predicates
    ;; physical state
    (at ?d - disk ?p - peg ?s - slot)
    (occupied ?p - peg ?s - slot)

    ;; sequencing and traceability
    (ready ?st - step)
    (step-unmoved ?st - step)
    (moved ?st - step ?d - disk ?fromp - peg ?froms - slot ?top - peg ?tos - slot ?m - agent)
    (verified-step ?st - step)
    (verified-by ?st - step ?a - agent)
    (observed-initial ?a - agent)

    ;; step ordering
    (succ ?s1 - step ?s2 - step)

    ;; disk size relation
    (larger ?big - disk ?small - disk)
  )

  ;; Observer reports initial state (traceable).
  (:action observer-report
    :parameters (?obs - agent)
    :precondition ()
    :effect (observed-initial ?obs)
  )

  ;; Auditor verifies a move and advances the ready step pointer.
  (:action auditor-verify-advance
    :parameters (?st - step ?stn - step ?d - disk ?fp - peg ?fs - slot ?tp - peg ?ts - slot ?aud - agent)
    :precondition (and
      (moved ?st ?d ?fp ?fs ?tp ?ts ?aud)
      (succ ?st ?stn)
    )
    :effect (and
      (not (moved ?st ?d ?fp ?fs ?tp ?ts ?aud))
      (verified-step ?st)
      (verified-by ?st ?aud)
      (not (ready ?st))
      (ready ?stn)
    )
  )

  ;; For completeness, allow auditor to finalize the sequence by verifying the last move
  ;; (last step has a successor in the problem as the final readiness marker).
  (:action auditor-verify-final
    :parameters (?st - step ?d - disk ?fp - peg ?fs - slot ?tp - peg ?ts - slot ?aud - agent)
    :precondition (moved ?st ?d ?fp ?fs ?tp ?ts ?aud)
    :effect (and
      (not (moved ?st ?d ?fp ?fs ?tp ?ts ?aud))
      (verified-step ?st)
      (verified-by ?st ?aud)
      (not (ready ?st))
    )
  )

  ;; Mover actions: concrete actions for each combination of source slot and target slot.
  ;; We provide a fully expanded set of move templates; each is guarded to ensure:
  ;; - the moved disk is present at the stated source slot,
  ;; - all slots above the source slot on that peg are empty (so the disk is the top disk on its peg),
  ;; - the target slot is the immediate top slot on the target peg (so the disk ends up on top),
  ;; - if placing onto an existing disk (target slot > 1) the disk below is larger than the moving disk,
  ;; - the step is the current ready step, the step has not yet had a move (step-unmoved),
  ;; - the observer has already reported the initial state (observed-initial).
  ;;
  ;; There are 7 source-slot x 7 target-slot templates; each template is generic in pegs and disks.
  ;; Each template name encodes the numeric slots moved-from and moved-to.
  ;; For space and clarity we enumerate them explicitly.

  ;; Helper note: slot names are slot1 (bottom) .. slot7 (top).
  ;; Precondition patterns below reference specific slot constants and explicit "not (occupied ...)" checks
  ;; to enforce "topness" constraints without arithmetic operations.

  ;; Move from slot1 -> slot1
  (:action move-slot1-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; ensure disk is top on source: no occupied slots above slot1
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target slot1 must be the immediate top slot on target peg:
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      ;; placing at bottom slot => no below-disk size check
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot1)
      (not (occupied ?from slot1))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot1 ?m)
    )
  )

  ;; Move from slot1 -> slot2
  (:action move-slot1-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st)
      (step-unmoved ?st)
      (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source topness
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot2:
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      ;; slot1 (below) must be occupied and that disk must be larger than the moving disk
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot2)
      (not (occupied ?from slot1))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot2 ?m)
    )
  )

  ;; Move from slot1 -> slot3
  (:action move-slot1-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source top
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target slot3 must be immediate top (slot2 below must be occupied)
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot3)
      (not (occupied ?from slot1))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot3 ?m)
    )
  )

  ;; Move from slot1 -> slot4
  (:action move-slot1-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source top
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot4:
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot4)
      (not (occupied ?from slot1))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot4 ?m)
    )
  )

  ;; Move from slot1 -> slot5
  (:action move-slot1-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source top
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot5:
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot5)
      (not (occupied ?from slot1))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot5 ?m)
    )
  )

  ;; Move from slot1 -> slot6
  (:action move-slot1-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source top
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot6:
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot6)
      (not (occupied ?from slot1))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot6 ?m)
    )
  )

  ;; Move from slot1 -> slot7
  (:action move-slot1-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot1)
      ;; source top
      (not (occupied ?from slot2)) (not (occupied ?from slot3))
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot7:
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot1))
      (at ?d ?to slot7)
      (not (occupied ?from slot1))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot1 ?to slot7 ?m)
    )
  )

  ;; Move from slot2 -> slot1
  (:action move-slot2-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      ;; source topness: slots 3..7 empty
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      ;; target slot1 is bottom slot immediate top if empty:
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot1)
      (not (occupied ?from slot2))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot1 ?m)
    )
  )

  ;; Move from slot2 -> slot2
  (:action move-slot2-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      ;; source top: 3..7 empty
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      ;; target slot2 must be immediate top: slot1 occupied and larger
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot2)
      (not (occupied ?from slot2))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot2 ?m)
    )
  )

  ;; Move from slot2 -> slot3
  (:action move-slot2-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      ;; target slot3 must be immediate top (slot2 occupied)
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot3)
      (not (occupied ?from slot2))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot3 ?m)
    )
  )

  ;; Move from slot2 -> slot4
  (:action move-slot2-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot4)
      (not (occupied ?from slot2))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot4 ?m)
    )
  )

  ;; Move from slot2 -> slot5
  (:action move-slot2-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot5)
      (not (occupied ?from slot2))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot5 ?m)
    )
  )

  ;; Move from slot2 -> slot6
  (:action move-slot2-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot6)
      (not (occupied ?from slot2))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot6 ?m)
    )
  )

  ;; Move from slot2 -> slot7
  (:action move-slot2-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot2)
      (not (occupied ?from slot3)) (not (occupied ?from slot4))
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot2))
      (at ?d ?to slot7)
      (not (occupied ?from slot2))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot2 ?to slot7 ?m)
    )
  )

  ;; Move from slot3 -> slot1
  (:action move-slot3-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      ;; source topness: 4..7 empty
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target immediate top at slot1
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot1)
      (not (occupied ?from slot3))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot1 ?m)
    )
  )

  ;; Move from slot3 -> slot2
  (:action move-slot3-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot2)
      (not (occupied ?from slot3))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot2 ?m)
    )
  )

  ;; Move from slot3 -> slot3
  (:action move-slot3-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot3)
      (not (occupied ?from slot3))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot3 ?m)
    )
  )

  ;; Move from slot3 -> slot4
  (:action move-slot3-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot4)
      (not (occupied ?from slot3))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot4 ?m)
    )
  )

  ;; Move from slot3 -> slot5
  (:action move-slot3-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot5)
      (not (occupied ?from slot3))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot5 ?m)
    )
  )

  ;; Move from slot3 -> slot6
  (:action move-slot3-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot6)
      (not (occupied ?from slot3))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot6 ?m)
    )
  )

  ;; Move from slot3 -> slot7
  (:action move-slot3-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot3)
      (not (occupied ?from slot4)) (not (occupied ?from slot5))
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot3))
      (at ?d ?to slot7)
      (not (occupied ?from slot3))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot3 ?to slot7 ?m)
    )
  )

  ;; Move from slot4 -> slot1
  (:action move-slot4-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      ;; source top: slots 5..7 empty
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      ;; target bottom
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot1)
      (not (occupied ?from slot4))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot1 ?m)
    )
  )

  ;; Move from slot4 -> slot2
  (:action move-slot4-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot2)
      (not (occupied ?from slot4))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot2 ?m)
    )
  )

  ;; Move from slot4 -> slot3
  (:action move-slot4-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot3)
      (not (occupied ?from slot4))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot3 ?m)
    )
  )

  ;; Move from slot4 -> slot4
  (:action move-slot4-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot4)
      (not (occupied ?from slot4))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot4 ?m)
    )
  )

  ;; Move from slot4 -> slot5
  (:action move-slot4-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot5)
      (not (occupied ?from slot4))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot5 ?m)
    )
  )

  ;; Move from slot4 -> slot6
  (:action move-slot4-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot6)
      (not (occupied ?from slot4))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot6 ?m)
    )
  )

  ;; Move from slot4 -> slot7
  (:action move-slot4-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot4)
      (not (occupied ?from slot5)) (not (occupied ?from slot6))
      (not (occupied ?from slot7))
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot4))
      (at ?d ?to slot7)
      (not (occupied ?from slot4))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot4 ?to slot7 ?m)
    )
  )

  ;; Move from slot5 -> slot1
  (:action move-slot5-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      ;; source topness: slots 6..7 empty
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      ;; target bottom
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot1)
      (not (occupied ?from slot5))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot1 ?m)
    )
  )

  ;; Move from slot5 -> slot2
  (:action move-slot5-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot2)
      (not (occupied ?from slot5))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot2 ?m)
    )
  )

  ;; Move from slot5 -> slot3
  (:action move-slot5-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot3)
      (not (occupied ?from slot5))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot3 ?m)
    )
  )

  ;; Move from slot5 -> slot4
  (:action move-slot5-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot4)
      (not (occupied ?from slot5))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot4 ?m)
    )
  )

  ;; Move from slot5 -> slot5
  (:action move-slot5-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot5)
      (not (occupied ?from slot5))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot5 ?m)
    )
  )

  ;; Move from slot5 -> slot6
  (:action move-slot5-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot6)
      (not (occupied ?from slot5))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot6 ?m)
    )
  )

  ;; Move from slot5 -> slot7
  (:action move-slot5-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot5)
      (not (occupied ?from slot6)) (not (occupied ?from slot7))
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot5))
      (at ?d ?to slot7)
      (not (occupied ?from slot5))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot5 ?to slot7 ?m)
    )
  )

  ;; Move from slot6 -> slot1
  (:action move-slot6-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      ;; source topness: slot7 empty
      (not (occupied ?from slot7))
      ;; target bottom
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot1)
      (not (occupied ?from slot6))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot1 ?m)
    )
  )

  ;; Move from slot6 -> slot2
  (:action move-slot6-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot2)
      (not (occupied ?from slot6))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot2 ?m)
    )
  )

  ;; Move from slot6 -> slot3
  (:action move-slot6-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot3)
      (not (occupied ?from slot6))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot3 ?m)
    )
  )

  ;; Move from slot6 -> slot4
  (:action move-slot6-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot4)
      (not (occupied ?from slot6))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot4 ?m)
    )
  )

  ;; Move from slot6 -> slot5
  (:action move-slot6-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot5)
      (not (occupied ?from slot6))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot5 ?m)
    )
  )

  ;; Move from slot6 -> slot6
  (:action move-slot6-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot6)
      (not (occupied ?from slot6))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot6 ?m)
    )
  )

  ;; Move from slot6 -> slot7
  (:action move-slot6-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot6)
      (not (occupied ?from slot7))
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot6))
      (at ?d ?to slot7)
      (not (occupied ?from slot6))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot6 ?to slot7 ?m)
    )
  )

  ;; Move from slot7 -> slot1
  (:action move-slot7-to-slot1
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      ;; source topness: no slots above slot7
      ;; target bottom empty
      (not (occupied ?to slot1))
      (not (occupied ?to slot2)) (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot1)
      (not (occupied ?from slot7))
      (occupied ?to slot1)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot1 ?m)
    )
  )

  ;; Move from slot7 -> slot2
  (:action move-slot7-to-slot2
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot2))
      (not (occupied ?to slot3)) (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot1)
      (at ?below ?to slot1)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot2)
      (not (occupied ?from slot7))
      (occupied ?to slot2)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot2 ?m)
    )
  )

  ;; Move from slot7 -> slot3
  (:action move-slot7-to-slot3
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot3))
      (not (occupied ?to slot4)) (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot2)
      (at ?below ?to slot2)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot3)
      (not (occupied ?from slot7))
      (occupied ?to slot3)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot3 ?m)
    )
  )

  ;; Move from slot7 -> slot4
  (:action move-slot7-to-slot4
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot4))
      (not (occupied ?to slot5)) (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot3)
      (at ?below ?to slot3)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot4)
      (not (occupied ?from slot7))
      (occupied ?to slot4)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot4 ?m)
    )
  )

  ;; Move from slot7 -> slot5
  (:action move-slot7-to-slot5
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot5))
      (not (occupied ?to slot6)) (not (occupied ?to slot7))
      (occupied ?to slot4)
      (at ?below ?to slot4)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot5)
      (not (occupied ?from slot7))
      (occupied ?to slot5)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot5 ?m)
    )
  )

  ;; Move from slot7 -> slot6
  (:action move-slot7-to-slot6
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot6))
      (not (occupied ?to slot7))
      (occupied ?to slot5)
      (at ?below ?to slot5)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot6)
      (not (occupied ?from slot7))
      (occupied ?to slot6)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot6 ?m)
    )
  )

  ;; Move from slot7 -> slot7
  (:action move-slot7-to-slot7
    :parameters (?st - step ?m - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (ready ?st) (step-unmoved ?st) (observed-initial ?m)
      (not (= ?from ?to))
      (at ?d ?from slot7)
      (not (occupied ?to slot7))
      (occupied ?to slot6)
      (at ?below ?to slot6)
      (larger ?below ?d)
    )
    :effect (and
      (not (at ?d ?from slot7))
      (at ?d ?to slot7)
      (not (occupied ?from slot7))
      (occupied ?to slot7)
      (not (step-unmoved ?st))
      (moved ?st ?d ?from slot7 ?to slot7 ?m)
    )
  )
)