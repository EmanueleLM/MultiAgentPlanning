(define (domain mysteryblocksworld12)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; Attack: requires province, planet and harmony on the same object;
  ;; produces pain on that object and removes its province, planet and the global harmony.
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

  ;; Succumb: requires pain on an object; restores province, planet and harmony for that object;
  ;; removes the pain.
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

  ;; Overcome: a painful object overcomes another object's province.
  ;; Preconditions: the other object must have province, and the acting object must have pain.
  ;; Effects: restores global harmony, gives province to the acting object, creates craves(acting,other),
  ;; and removes the other's province and the acting object's pain.
  (:action overcome
    :parameters (?actor - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain ?actor)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
    )
  )

  ;; Feast: an object that craves another and currently has province and harmony can feast.
  ;; Effects: produces pain on the feaster, gives province to the other object,
  ;; and removes the craves relation, the feaster's province, and harmony.
  (:action feast
    :parameters (?feaster - obj ?other - obj)
    :precondition (and
      (craves ?feaster ?other)
      (province ?feaster)
      (harmony)
    )
    :effect (and
      (pain ?feaster)
      (province ?other)
      (not (craves ?feaster ?other))
      (not (province ?feaster))
      (not (harmony))
    )
  )
)