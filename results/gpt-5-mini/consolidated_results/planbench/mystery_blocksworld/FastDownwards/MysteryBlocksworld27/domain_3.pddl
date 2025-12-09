(define (domain mystery-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?o - obj ?t - obj)
    (harmony)
    (pain)
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; All actions advance the explicit current step to a direct successor to enforce
  ;; ordered, contiguous progression of stages. Each action requires (current ?s)
  ;; and (succ ?s ?s2) in its precondition and moves the marker from ?s to ?s2.
  ;; This enforces a discrete-time linear schedule and forbids retroactive fixes.

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