(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (harmony)
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; Attack: consumes province and planet of the actor and global harmony, produces pain on actor
  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb: requires pain on actor and restores province, planet and harmony
  (:action succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome: actor with pain uses another's province to regain harmony, its own province and starts craving the other
  (:action overcome
    :parameters (?x - obj ?other - obj)
    :precondition (and (province ?other) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain ?x))
    )
  )

  ;; Feast: actor that craves another consumes that craving, loses its province and harmony, produces pain and gives province to the other
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)