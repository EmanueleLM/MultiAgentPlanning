(define (domain feast-attack-toggle)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
  )

  ;; Attack: requires a province and a planet and harmony.
  ;; Effects: produces pain and removes the specified province and planet and harmony.
  (:action attack
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: requires pain. It restores a chosen province and planet and restores harmony; removes pain.
  ;; Note: the human specification does not tie this to any previously attacked pair, so the action is
  ;; parameterized and may restore any chosen objects.
  (:action succumb
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (pain)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
    )
  )

  ;; Overcome: requires that some other object has province and that pain holds.
  ;; Effects: sets harmony, gives province to ?x, makes ?x crave ?y; removes the other's province and pain.
  (:action overcome
    :parameters (?x - object ?y - object)
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

  ;; Feast: requires that X craves Y, X holds province, and harmony holds.
  ;; Effects: produces pain, gives province to Y, removes the craves relation, removes X's province and harmony.
  (:action feast
    :parameters (?x - object ?y - object)
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