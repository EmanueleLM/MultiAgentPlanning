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
    (distinct ?x ?y - obj)     ; explicit inequality relation
  )

  ;; Attack: requires a province, a planet, and harmony; produces pain and removes the province, planet, and harmony.
  ;; Consumes the current stage and advances to the next stage to enforce discrete, contiguous progression.
  (:action attack
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (current ?s)
      (next ?s ?s2)
      (distinct ?prov ?pl)
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

  ;; Succumb: requires pain. It restores a province and a planet and harmony, and clears pain.
  ;; To avoid no-op oscillation, require the targeted province and planet to be absent so Succumb actually restores them.
  ;; Advances the stage.
  (:action succumb
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (pain)
      (current ?s)
      (next ?s ?s2)
      (distinct ?prov ?pl)
      (not (province ?prov))
      (not (planet ?pl))
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

  ;; Overcome: requires a province (the "other" object) and pain. It restores harmony, makes ?x a province and craves ?x ?y,
  ;; removes the previous province ?y and clears pain. Advances the stage.
  (:action overcome
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?y)
      (pain)
      (current ?s)
      (next ?s ?s2)
      (distinct ?x ?y)
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

  ;; Feast: requires an existing craves relation, a province for the craver, and harmony.
  ;; It produces pain and makes the craved object a province, removing the craving, the craver's province, and harmony.
  ;; Advances the stage.
  (:action feast
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?s)
      (next ?s ?s2)
      (distinct ?x ?y)
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