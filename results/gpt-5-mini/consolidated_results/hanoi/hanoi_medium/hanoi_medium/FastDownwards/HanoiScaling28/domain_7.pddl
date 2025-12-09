(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (on ?d - object ?o - object)
    (clear ?o - object)
    (smaller ?d1 - object ?d2 - object)

    (phase-operator ?s - step)
    (phase-auditor ?s - step)
    (phase-observer ?s - step)

    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)

    (finished)
  )

  (:action operator-move-to-peg
    :parameters (?d - object ?from - object ?to - object ?s - step)
    :precondition (and
      (phase-operator ?s)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

  (:action operator-move-to-disk
    :parameters (?d - object ?from - object ?to - object ?s - step)
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
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (phase-operator ?s))
      (phase-auditor ?s)
    )
  )

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