(define (domain provinces)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?x ?y - obj)
    (harmony)
    (pain)
    (current ?s - stage)       ; current discrete time/stage marker
    (next ?s1 ?s2 - stage)     ; successor relation between stages
  )

  ;; Attack: requires a province, a planet, and harmony; produces pain and removes the province, planet, and harmony.
  ;; Advances the current stage to enforce discrete, contiguous progression.
  (:action attack
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Succumb: requires pain. Restores a province and a planet and harmony, and clears pain.
  ;; Advances the current stage.
  (:action succumb
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (pain)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Overcome: requires that some object ?y is a province and pain. It makes ?x a province and establishes (craves ?x ?y),
  ;; removes the previous province ?y, clears pain, and restores harmony. Advances the current stage.
  (:action overcome
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?y)
      (pain)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast: requires an existing craves relation (x craves y), a province for the craver x, and harmony.
  ;; It produces pain and makes the craved object y a province, removing the craving, the craver's province, and harmony.
  ;; Advances the current stage.
  (:action feast
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)