(define (domain mystery-blocksworld40)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
  )
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (object_craves ?o1 - object ?o2 - object)
  )

  (:action attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o)) ; Invariant: an object cannot be both province and pain
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
      (not (province ?o)) ; Invariant: an object cannot be both province and pain
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?target - object ?source - object)
    :precondition (and
      (province ?source)
      (not (pain ?source)) ; Invariant: an object cannot be both province and pain
      (pain ?target)
      (not (province ?target)) ; Invariant: an object cannot be both province and pain
    )
    :effect (and
      (harmony)
      (province ?target)
      (object_craves ?target ?source)
      (not (province ?source))
      (not (pain ?target))
    )
  )

  (:action feast
    :parameters (?eater - object ?food - object)
    :precondition (and
      (object_craves ?eater ?food)
      (province ?eater)
      (not (pain ?eater)) ; Invariant: an object cannot be both province and pain
      (harmony)
    )
    :effect (and
      (pain ?eater)
      (province ?food)
      (not (object_craves ?eater ?food))
      (not (province ?eater))
      (not (harmony))
      (not (pain ?food)) ; Added to maintain province/pain mutual exclusivity invariant
    )
  )
)