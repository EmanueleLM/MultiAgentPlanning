(define (domain mysteryblocksworld23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (craves ?o - obj ?p - obj)       ; ?o craves ?p
    (planet ?o - obj)                ; ?o is a planet
    (province ?o - obj)              ; ?o is a province
    (attacked ?o - obj)              ; ?o was attacked and awaits succumb
    (harmony)                         ; global harmony phase fluent
    (pain)                            ; global pain phase fluent

    (stage ?s - stage)               ; stage objects
    (succ ?s - stage ?t - stage)     ; successor relation between stages (ordered)
    (current ?s - stage)             ; current stage
    (phase_harmony ?s - stage)       ; stage ?s corresponds to harmony
    (phase_pain ?s - stage)          ; stage ?s corresponds to pain
  )

  ; Attack: requires the target to be a province and a planet, and the system to be in a harmony stage.
  ; Consumes target's province and planet, marks it attacked, switches global phase to pain, and advances the current stage to its successor.
  (:action attack
    :parameters (?x - obj ?s - stage ?t - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (current ?s)
      (succ ?s ?t)
      (phase_harmony ?s)
      (harmony)
    )
    :effect (and
      (pain)
      (not (harmony))
      (not (province ?x))
      (not (planet ?x))
      (attacked ?x)
      (not (current ?s))
      (current ?t)
    )
  )

  ; Succumb: resolves a specific attacked object while in a pain stage.
  ; Restores that object's province and planet, clears attacked and pain, sets harmony, and advances stage.
  (:action succumb
    :parameters (?x - obj ?s - stage ?t - stage)
    :precondition (and
      (pain)
      (attacked ?x)
      (current ?s)
      (succ ?s ?t)
      (phase_pain ?s)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
      (not (attacked ?x))
      (not (current ?s))
      (current ?t)
    )
  )

  ; Overcome: while in a pain stage and given some province ?y, create a craving from ?x to ?y,
  ; transfer a province to ?x, restore harmony, and advance the stage. Removes province from ?y and clears pain.
  (:action overcome
    :parameters (?x - obj ?y - obj ?s - stage ?t - stage)
    :precondition (and
      (province ?y)
      (pain)
      (current ?s)
      (succ ?s ?t)
      (phase_pain ?s)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
      (not (current ?s))
      (current ?t)
    )
  )

  ; Feast: while in a harmony stage, an object holding a province that craves another consumes that craving,
  ; transfers the province to the craved object, enters pain, clears harmony, and advances the stage.
  (:action feast
    :parameters (?x - obj ?y - obj ?s - stage ?t - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?s)
      (succ ?s ?t)
      (phase_harmony ?s)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?s))
      (current ?t)
    )
  )

)