(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (planet ?o - obj)
    (province ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; Attack: unary. Requires the object to be both a province and a planet, and harmony.
  ;; Effects: the object gains pain and loses its province and planet; global harmony is lost.
  (:action attack
    :parameters (?o - obj)
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

  ;; Succumb: unary. Requires pain on the object.
  ;; Effects: restores province, planet and harmony; removes pain.
  (:action succumb
    :parameters (?o - obj)
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

  ;; Overcome: binary (object overcomes other).
  ;; Requires: other has province, object has pain.
  ;; Effects: grants harmony, gives province to object and makes object crave other;
  ;;          removes province from other and removes object's pain.
  (:action overcome
    :parameters (?o - obj ?other - obj)
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

  ;; Feast: binary (object feasts from other).
  ;; Requires: object craves other, object has province, harmony holds.
  ;; Effects: object gains pain, other gains province; removes the craving, object's province, and harmony.
  (:action feast
    :parameters (?o - obj ?other - obj)
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