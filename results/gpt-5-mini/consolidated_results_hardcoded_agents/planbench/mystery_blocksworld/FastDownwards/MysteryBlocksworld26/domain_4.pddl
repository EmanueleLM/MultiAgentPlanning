(define (domain provinces)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?x ?y - obj)
    (harmony)
    (pain)
    (current ?s - stage)
    (next ?s1 ?s2 - stage)
  )

  ;; Attack: requires a province object, a planet object, and harmony.
  ;; Effects: pain becomes true; the specified province, planet, and harmony become false.
  ;; Enforces discrete, contiguous stage progression via current/next markers.
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

  ;; Succumb: requires pain.
  ;; Effects: sets the specified province and planet and harmony true; clears pain.
  ;; Advances stage.
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

  ;; Overcome: requires that ?other is a province and that pain holds.
  ;; Effects: restores harmony, makes ?x a province and (craves ?x ?other) true;
  ;; removes province status from ?other and clears pain.
  ;; Advances stage.
  (:action overcome
    :parameters (?x - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?other)
      (pain)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast: requires (craves ?x ?y), province for ?x, and harmony.
  ;; Effects: produces pain, makes ?y a province; removes the craving, the province mark from ?x, and harmony.
  ;; Advances stage.
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