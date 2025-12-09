(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg step)

  (:predicates
    (on ?d - disk ?o - object)           ;; disk directly on object (disk or peg)
    (clear ?o - object)                 ;; nothing is on top of object
    (smaller ?d1 - disk ?d2 - disk)     ;; d1 is smaller than d2
    (different ?o1 - object ?o2 - object) ;; explicit inequality for objects

    ;; staged pipeline control (explicit step objects)
    (phase-operator ?s - step)
    (phase-auditor ?s - step)
    (phase-observer ?s - step)

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
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; after removing ?d, the object it was on becomes clear
      (clear ?from)

      ;; destination peg now has ?d on top -> not clear
      (not (clear ?to))

      ;; moved disk has nothing on top
      (clear ?d)

      ;; advance pipeline for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Move a top disk onto another top disk (obey size ordering)
  (:action operator-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; underlying object becomes clear after removing ?d
      (clear ?from)

      ;; target disk now has something on top -> not clear
      (not (clear ?to))

      ;; moved disk has nothing on top
      (clear ?d)

      ;; advance pipeline for this step
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  ;; Auditor approves the operator's action for the step
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

  ;; Observer records the step and advances to next step's operator phase
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