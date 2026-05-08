(define (domain mystery_blocksworld16)
  (:requirements :strips :typing)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?x - object ?y - object)
  )

  ;; Attack: consumes province, planet and harmony on the same object and produces pain on that object.
  (:action attacker_attack
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: from pain on an object, restore province, planet and harmony for that object.
  (:action succumber_succumb
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: requires province on the "other" object and pain on primary; gives harmony,
  ;; grants province to the primary and makes the primary crave the other; removes province from other and pain from primary.
  (:action overcomer_overcome
    :parameters (?o - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: when a primary object craves another and the primary holds province and harmony,
  ;; consume the crave, move province to the other, produce pain on the primary, and remove harmony.
  (:action feaster_feast
    :parameters (?o - object ?other - object)
    :precondition (and
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)