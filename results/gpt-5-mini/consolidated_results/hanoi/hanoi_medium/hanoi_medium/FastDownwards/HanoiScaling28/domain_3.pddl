(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; disk is directly on a place (disk or peg)
    (on ?d - disk ?p - place)

    ;; nothing on top of this place (a disk or a peg)
    (clear ?p - place)

    ;; size ordering: d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; distinctness predicate to forbid no-op moves
    (different ?p1 - place ?p2 - place)

    ;; step coordination (explicit staged ordering)
    (awaiting-operator ?s - step)
    (awaiting-auditor ?s - step)
    (awaiting-observer ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)
    (finished)
  )

  ;; Operator: move a top disk onto an empty peg/place
  (:action operator-move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)       ; ?d must be the top disk of its stack
      (clear ?to)      ; destination peg must be clear (empty on top)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; After removing ?d, the place it was on becomes clear.
      ;; (If there was a disk immediately below ?d, that disk becomes clear;
      ;; we represent this by making the supporting place clear — correctness
      ;; ensured by preconditions and the on relation being direct support.)
      (clear ?from)

      ;; destination is no longer clear (now has ?d on top)
      (not (clear ?to))

      ;; sequencing: operator -> auditor
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  ;; Operator: move a top disk onto another disk (must be smaller than the target disk)
  (:action operator-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)         ; ?d must be the top disk of its stack
      (clear ?to)        ; target disk must be the top disk of its stack
      (smaller ?d ?to)   ; legal: moving disk must be smaller than target disk
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source place becomes clear (now nothing directly on it)
      (clear ?from)

      ;; placing on a disk makes that disk no longer clear (has ?d on top)
      (not (clear ?to))

      ;; sequencing: operator -> auditor
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  ;; Auditor must approve each operator move before observer records it
  (:action auditor-approve
    :parameters (?s - step)
    :precondition (and
      (awaiting-auditor ?s)
    )
    :effect (and
      (not (awaiting-auditor ?s))
      (awaiting-observer ?s)
    )
  )

  ;; Observer records the step and advances to the next step object
  (:action observer-record-next
    :parameters (?s - step ?s2 - step)
    :precondition (and
      (awaiting-observer ?s)
      (step-next ?s ?s2)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (awaiting-operator ?s2)
    )
  )

  ;; Observer records final step and marks finished
  (:action observer-record-final
    :parameters (?s - step)
    :precondition (and
      (awaiting-observer ?s)
      (final-step ?s)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (finished)
    )
  )
)