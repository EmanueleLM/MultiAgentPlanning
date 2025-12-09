(define (domain mystery-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    ;; world state predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?t - obj)
    (harmony)
    (pain)

    ;; explicit temporal sequencing to enforce ordered, contiguous progression
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;;; Modeling note:
  ;;; - Time is modeled explicitly with step objects and succ links. Every action
  ;;;   requires (current ?s) and a successor (succ ?s ?s2) and moves the current
  ;;;   marker forward. This enforces a strict linear ordering and forbids
  ;;;   retroactive changes or oscillation.
  ;;; - No bookkeeping shortcuts (tokens, quotas, post-hoc penalties) are used.
  ;;; - Actions' preconditions and effects exactly implement the human
  ;;;   specification: they add/remove only the listed fluents and advance time.

  (:action attack
    :parameters (?o - obj ?s - step ?s2 - step)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action succumb
    :parameters (?o - obj ?s - step ?s2 - step)
    :precondition (and
      (pain)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action overcome
    :parameters (?p - obj ?other - obj ?s - step ?s2 - step)
    :precondition (and
      (province ?other)
      (pain)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?p)
      (craves ?p ?other)
      (not (province ?other))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action feast
    :parameters (?p - obj ?other - obj ?s - step ?s2 - step)
    :precondition (and
      (craves ?p ?other)
      (province ?p)
      (harmony)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?p ?other))
      (not (province ?p))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)