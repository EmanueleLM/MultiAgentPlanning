(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object step)

  (:predicates
    ;; Disk d is directly on object o (object = disk or peg)
    (on ?d - disk ?o - object)
    ;; Nothing is on top of object o (object may be a peg or a disk)
    (clear ?o - object)
    ;; Size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; Explicit distinctness predicate for objects (used instead of numeric inequality)
    (different ?o1 - object ?o2 - object)

    ;; Phase control for ordered operator/auditor/observer pipeline per step
    (phase-operator ?s - step)
    (phase-auditor ?s - step)
    (phase-observer ?s - step)

    ;; Step sequencing
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)

    ;; Global finish marker
    (finished)
  )

  ;; Operator moves a top disk onto an empty peg
  (:action operator-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)          ;; ?d must be top of its stack
      (clear ?to)         ;; destination peg must be empty (top)
      (different ?from ?to)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the object that was under ?d becomes clear
      (clear ?from)

      ;; destination peg no longer clear
      (not (clear ?to))

      ;; moved disk has nothing on top
      (clear ?d)

      ;; advance phase: operator -> auditor for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Operator moves a top disk onto another disk (must be smaller than target)
  (:action operator-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)           ;; ?d must be top of its stack
      (clear ?to)          ;; target disk must be top of its stack
      (smaller ?d ?to)     ;; legal move: moved disk smaller than target disk
      (different ?from ?to)
    )
    :effect (and
      ;; update disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the object that was under ?d becomes clear
      (clear ?from)

      ;; target disk no longer clear (now has ?d on top)
      (not (clear ?to))

      ;; moved disk has nothing on top
      (clear ?d)

      ;; advance phase: operator -> auditor for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Auditor approves the operator's move for the current step
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

  ;; Observer records the step and advances the pipeline to the next step
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

  ;; Observer records the final step and sets finished
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