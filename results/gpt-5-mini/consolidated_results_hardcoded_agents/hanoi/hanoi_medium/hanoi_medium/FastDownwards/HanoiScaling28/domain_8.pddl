(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg step)

  (:predicates
    ;; disk/stack relations
    (on ?d - disk ?o - object)        ;; disk d is directly on object o (disk or peg)
    (clear ?o - object)              ;; object (disk or peg) has nothing on top
    (smaller ?d1 - disk ?d2 - disk)  ;; d1 is smaller than d2

    ;; stage/phase control
    (phase-operator ?s - step)
    (phase-auditor ?s - step)
    (phase-observer ?s - step)

    ;; step ordering
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)

    (finished)
  )

  ;; Move a top disk onto an empty peg
  (:action operator-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)     ;; disk is top of its stack
      (clear ?to)    ;; target peg is empty (no top disk)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removal, the object that d was on becomes clear
      (clear ?from)

      ;; placing d makes the target not clear
      (not (clear ?to))

      ;; d is top at its new location
      (clear ?d)

      ;; advance phases for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Move a top disk onto another disk (must be smaller)
  (:action operator-move-onto-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)           ;; disk is top of its stack
      (clear ?to)          ;; target disk is currently top (nothing on it)
      (smaller ?d ?to)     ;; moved disk must be smaller than target disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the object that d was on becomes clear after removal
      (clear ?from)

      ;; target disk now has something on it
      (not (clear ?to))

      ;; d is top at its new location
      (clear ?d)

      ;; advance phases for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Auditor approves the operator's move for the same step
  (:action auditor-approve
    :parameters (?s - step)
    :precondition (and
      (phase-auditor ?s)
    )
    :effect (and
      (not (phase-auditor ?s))
      (phase-observer ?s)
    )
  )

  ;; Observer records and advances to the next step
  (:action observer-record-next
    :parameters (?s - step ?s2 - step)
    :precondition (and
      (phase-observer ?s)
      (step-next ?s ?s2)
    )
    :effect (and
      (not (phase-observer ?s))
      (phase-operator ?s2)
    )
  )

  ;; Observer records the final step and marks finished
  (:action observer-record-final
    :parameters (?s - step)
    :precondition (and
      (phase-observer ?s)
      (final-step ?s)
    )
    :effect (and
      (not (phase-observer ?s))
      (finished)
    )
  )
)