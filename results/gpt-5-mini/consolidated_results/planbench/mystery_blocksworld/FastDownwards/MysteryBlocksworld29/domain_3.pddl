(define (domain mysteryblocksworld29)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
    (now ?s - stage)
    (next ?s - stage ?t - stage)
  )

  ;; Attack: requires the object to simultaneously be a province and a planet and harmony;
  ;; consumes those facts, produces pain on the same object, and advances the global stage.
  (:action attack
    :parameters (?o - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (pain ?o)
      (not (now ?s))
      (now ?t)
    )
  )

  ;; Succumb: requires pain on the object; restores province, planet and harmony on that object,
  ;; clears pain, and advances the global stage.
  (:action succumb
    :parameters (?o - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (now ?s))
      (now ?t)
    )
  )

  ;; Overcome: requires some other object to be a province and the subject to be in pain;
  ;; transfers province status from the other to the subject, creates a craving of subject for other,
  ;; restores harmony, clears pain, and advances the global stage.
  (:action overcome
    :parameters (?o - obj ?other - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
      (not (now ?s))
      (now ?t)
    )
  )

  ;; Feast: requires that the subject craves the other, subject holds province and harmony;
  ;; resolves the craving, creates pain on the subject, transfers province to the other,
  ;; removes harmony, and advances the global stage.
  (:action feast
    :parameters (?o - obj ?other - obj ?s - stage ?t - stage)
    :precondition (and
      (now ?s)
      (next ?s ?t)
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
      (not (now ?s))
      (now ?t)
    )
  )
)