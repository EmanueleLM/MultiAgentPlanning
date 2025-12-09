(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; a disk is directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top
    (clear ?p - place)
    ;; size relation: d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; phased step control
    (phase-operator ?s - step)
    (phase-auditor ?s - step)
    (phase-observer ?s - step)

    ;; linear step ordering
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)

    ;; terminal condition
    (finished)
  )

  ;; Operator moves a top disk onto an empty peg
  (:action operator-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removal, the supporting object becomes clear
      (clear ?from)

      ;; placing d makes the target not clear
      (not (clear ?to))

      ;; d is top at its new location
      (clear ?d)

      ;; advance phases for this step (operator -> auditor)
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Operator moves a top disk onto another top disk (must be smaller)
  (:action operator-move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the supporting object becomes clear after removal
      (clear ?from)

      ;; target disk now has something on it
      (not (clear ?to))

      ;; d is top at its new location
      (clear ?d)

      ;; advance phases for this step (operator -> auditor)
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