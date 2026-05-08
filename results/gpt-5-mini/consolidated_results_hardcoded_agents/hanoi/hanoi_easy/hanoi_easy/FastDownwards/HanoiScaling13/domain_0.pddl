(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place step)
  ;; disks and pegs are places (places can be pegs or disks)
  ;; declare subtyping by using disk and peg where place is expected
  (:predicates
    ;; state of disks/pegs
    (on ?d - disk ?p - place)            ;; disk ?d is directly on place ?p (p is either a peg or another disk)
    (clear ?p - place)                  ;; no disk sits on top of place ?p (p may be peg or disk)

    ;; static size relation (disk ordering)
    (smaller ?d1 - disk ?d2 - disk)     ;; ?d1 is strictly smaller than ?d2

    ;; sequencing control for explicit ordered move sequence
    (current-step ?s - step)            ;; which step is currently active
    (moved ?s - step)                   ;; mover has executed the move for step ?s (awaiting observer)
    (confirmed ?s - step)               ;; observer confirmed step ?s
    (step-successor ?s1 - step ?s2 - step) ;; successor relation between steps (enforces contiguity)
    (last-step ?s - step)               ;; marks the last step in the required sequence

    ;; per-step required move specification (enforces the exact proposed move sequence)
    (required-disk ?s - step ?d - disk)
    (required-from ?s - step ?p - place)
    (required-to ?s - step ?p2 - place)

    ;; completion / audit
    (all-confirmed)
    (audited)
  )

  ;; ACTIONS: mover (per-step moves). Two distinct move actions:
  ;;   - mover_move_to_peg: moving the required disk to a peg target
  ;;   - mover_move_to_disk: moving the required disk to a disk target
  ;; Both require the step to be the current step and that no move for that step has yet been executed.
  ;; They also require the exact disk/from/to mapping for that step (enforcing the given sequence).
  (:action mover_move_to_peg
    :parameters (?s - step ?d - disk ?from - place ?to - peg)
    :precondition (and
      (current-step ?s)
      (not (moved ?s))
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)          ;; the disk is currently on the stated source place
      (clear ?d)             ;; disk has nothing on top
      (clear ?to)            ;; target place is clear (peg is empty or topable)
      (not (= ?from ?to))    ;; prevent no-op move to same place
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target becomes not clear (occupied by ?d); source place becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; mark this step's move as done (so observer can confirm)
      (moved ?s)
    )
  )

  (:action mover_move_to_disk
    :parameters (?s - step ?d - disk ?from - place ?to - disk)
    :precondition (and
      (current-step ?s)
      (not (moved ?s))
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)       ;; size ordering: moved disk must be smaller than disk at target
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (moved ?s)
    )
  )

  ;; OBSERVER: confirms a step after the mover executed it.
  ;; Two observer actions:
  ;;   - observer_confirm_intermediate: for non-last steps, move confirmation advances current-step to successor
  ;;   - observer_confirm_last: for the last step, confirm and set all-confirmed (no successor)
  (:action observer_confirm_intermediate
    :parameters (?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (moved ?s)
      (not (confirmed ?s))
      (step-successor ?s ?snext)
      (not (last-step ?s))   ;; intermediate steps only
    )
    :effect (and
      (confirmed ?s)
      (not (moved ?s))
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action observer_confirm_last
    :parameters (?s - step)
    :precondition (and
      (current-step ?s)
      (moved ?s)
      (not (confirmed ?s))
      (last-step ?s)
    )
    :effect (and
      (confirmed ?s)
      (not (moved ?s))
      (not (current-step ?s))
      (all-confirmed)
    )
  )

  ;; AUDITOR: produces a final audited report, only possible after all-confirmed.
  (:action auditor_report
    :parameters ()
    :precondition (and
      (all-confirmed)
      (not (audited))
    )
    :effect (and
      (audited)
    )
  )
)