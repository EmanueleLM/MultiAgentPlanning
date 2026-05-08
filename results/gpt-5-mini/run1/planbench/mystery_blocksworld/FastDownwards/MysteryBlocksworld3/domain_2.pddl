(define (domain mystery_blocksworld3)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
    (pain)
  )

  ;; Attack: requires province and planet for the same object and global harmony.
  ;; Effects: produces global pain and removes the province, planet, and harmony facts.
  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: can be applied while there is pain; it restores province and planet for the chosen object and global harmony, and removes pain.
  ;; The object parameter is the one whose province/planet are restored.
  (:action succumb
    :parameters (?o - obj)
    :precondition (and (pain))
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
    )
  )

  ;; Overcome: requires some other object to have province and global pain.
  ;; Effects: restores harmony, gives province to ?o, creates a craving from ?o to ?other,
  ;; and removes province from ?other and the global pain.
  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and (province ?other) (pain))
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain))
    )
  )

  ;; Feast: requires a craving, province for the craver, and harmony.
  ;; Effects: produces pain and transfers province to ?other; removes the craving,
  ;; removes province from the craver, and removes harmony.
  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and (craves ?o ?other) (province ?o) (harmony))
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)