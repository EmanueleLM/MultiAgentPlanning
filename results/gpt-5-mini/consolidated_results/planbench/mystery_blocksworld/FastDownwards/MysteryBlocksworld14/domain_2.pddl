(define (domain MysteryBlocksworld14)
  (:requirements :strips :typing)
  (:types entity)

  (:predicates
    (province ?e - entity)                   ; dynamic: whether an entity holds a province
    (planet ?e - entity)                     ; dynamic: whether an entity holds a planet
    (harmony)                                ; global harmony flag
    (pain)                                   ; global pain flag
    (craves ?x - entity ?y - entity)         ; x craves y
  )

  ;; Attack: requires the target to have both province and planet and global harmony.
  ;; Produces global pain and removes the target's province, planet and harmony.
  (:action attack
    :parameters (?o - entity)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: when global pain holds, an entity can succumb, restoring its province, planet and harmony.
  ;; Consumes pain.
  (:action succumb
    :parameters (?o - entity)
    :precondition (and
      (pain)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
    )
  )

  ;; Overcome: x overcomes y if y currently holds a province and global pain is true.
  ;; Result: harmony true, x gains a province and craves y; y loses its province and pain is cleared.
  (:action overcome
    :parameters (?x - entity ?y - entity)
    :precondition (and
      (province ?y)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Feast: x feasts on y when x craves y, x holds a province, and harmony is true.
  ;; Result: global pain true and y receives a province. Removes the craves relation, x's province, and harmony.
  (:action feast
    :parameters (?x - entity ?y - entity)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)