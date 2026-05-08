(define (domain mystery_blocksworld6)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; Attack: requires the object to be both a province and a planet and global harmony.
  ;; After attack the object becomes in pain and loses province, planet and harmony.
  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: heals pain on an object, restoring its province and planet status and global harmony.
  (:action succumb
    :parameters (?o - obj)
    :precondition (and (pain ?o))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: a subject object (?o) overcomes with respect to another (?other).
  ;; Requires that ?other currently has province and that ?o is in pain.
  ;; Effects: grants harmony, gives province to ?o, creates craves(?o, ?other),
  ;; and removes province from ?other and pain from ?o.
  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain ?o))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: subject ?o that craves ?other and is a province while harmony holds, feasts on ?other.
  ;; Effects: produces pain on ?o, transfers province to ?other, and removes the craving, province of ?o and harmony.
  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )

)