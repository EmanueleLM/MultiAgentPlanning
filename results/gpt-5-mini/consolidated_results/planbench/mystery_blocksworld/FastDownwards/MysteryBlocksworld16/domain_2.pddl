(define (domain MysteryBlocksworld16)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj phase)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)

    (pain ?o - obj)
    (craves ?x - obj ?y - obj)

    ;; record of which province/planet pair Attack removed so Succumb can
    ;; restore them exactly
    (attacked ?x - obj ?y - obj)

    ;; discrete, ordered phases to enforce contiguous progression
    (current-phase ?p - phase)
    (successor ?p1 - phase ?p2 - phase)
  )

  ;; attacker: Attack action
  (:action attacker-attack
    :parameters (?o - obj ?p - obj ?ph - phase ?phn - phase)
    :precondition (and
      (province ?o)
      (planet ?p)
      (harmony)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (pain ?o)
      (attacked ?o ?p)

      (not (province ?o))
      (not (planet ?p))
      (not (harmony))

      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; succumber: Succumb action
  (:action succumber-succumb
    :parameters (?o - obj ?p - obj ?ph - phase ?phn - phase)
    :precondition (and
      (pain ?o)
      (attacked ?o ?p)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (province ?o)
      (planet ?p)
      (harmony)

      (not (pain ?o))
      (not (attacked ?o ?p))

      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; overcomer: Overcome action
  (:action overcomer-overcome
    :parameters (?x - obj ?other - obj ?ph - phase ?phn - phase)
    :precondition (and
      (province ?other)
      (pain ?x)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)

      (not (province ?other))
      (not (pain ?x))

      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )

  ;; feaster: Feast action
  (:action feaster-feast
    :parameters (?x - obj ?other - obj ?ph - phase ?phn - phase)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
      (current-phase ?ph)
      (successor ?ph ?phn)
    )
    :effect (and
      (pain ?x)
      (province ?other)

      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))

      (not (current-phase ?ph))
      (current-phase ?phn)
    )
  )
)