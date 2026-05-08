(define (domain MysteryBlocksworld14)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity stage)

  (:predicates
    (province ?e - entity)                     ; entity holds a province
    (planet ?e - entity)                       ; entity holds a planet
    (harmony)                                  ; global harmony flag
    (pain)                                     ; global pain flag
    (craves ?x - entity ?y - entity)           ; x craves y
    (at-stage ?s - stage)                      ; current stage marker (single true stage)
    (succ ?s1 - stage ?s2 - stage)             ; successor relation between stages (static)
  )

  ;; Attack: consumes a specific entity's province and planet and global harmony, produces global pain.
  ;; Requires being at a stage s with a defined successor s2; consumes at-stage s and moves to s2.
  (:action attack
    :parameters (?o - entity ?s - stage ?s2 - stage)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (pain)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Succumb: when global pain holds, an entity can succumb restoring its province, planet, and harmony.
  ;; Consumes pain. Advances the global stage.
  (:action succumb
    :parameters (?o - entity ?s - stage ?s2 - stage)
    :precondition (and
      (pain)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Overcome: x overcomes y if y currently holds a province and global pain is true.
  ;; Result: harmony true, x gains a province, x craves y. Removes y's province and clears pain.
  ;; Advances the global stage.
  (:action overcome
    :parameters (?x - entity ?y - entity ?s - stage ?s2 - stage)
    :precondition (and
      (province ?y)
      (pain)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Feast: x feasts on y when x craves y, x holds a province, and harmony is true.
  ;; Result: global pain true and y receives a province. Removes the craves relation, x's province, and harmony.
  ;; Advances the global stage.
  (:action feast
    :parameters (?x - entity ?y - entity ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)