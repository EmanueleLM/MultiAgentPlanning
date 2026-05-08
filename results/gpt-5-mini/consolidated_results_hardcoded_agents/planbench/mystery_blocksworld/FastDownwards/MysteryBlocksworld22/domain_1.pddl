(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing stage)
  (:predicates
    (craves ?who - thing ?what - thing)
    (province ?x - thing)
    (planet ?x - thing)
    (pain ?x - thing)
    (harmony)
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Attack: requires a province object, a planet object, and harmony.
  ;; Effects: creates pain on the province object; removes the province, the specified planet, and harmony.
  ;; Moves the global stage forward from ?s to its successor ?s2 (succ predicate enforces ordering).
  (:action attack
    :parameters (?p - thing ?pl - thing ?s - stage ?s2 - stage)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (harmony)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (pain ?p)
      (not (province ?p))
      (not (planet ?pl))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Succumb: requires pain on an object.
  ;; Effects: restores province and planet facts (for the given parameters) and harmony; removes the pain.
  ;; Advances the stage from ?s to ?s2.
  (:action succumb
    :parameters (?p - thing ?pl - thing ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?p)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (province ?p)
      (planet ?pl)
      (harmony)
      (not (pain ?p))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Overcome: requires (province ?other) and (pain ?obj).
  ;; Effects: adds harmony, restores province for ?obj, and creates craves(?obj, ?other).
  ;; Removes the province on ?other and the pain on ?obj.
  ;; Advances the stage from ?s to ?s2.
  (:action overcome
    :parameters (?obj - thing ?other - thing ?s - stage ?s2 - stage)
    :precondition (and
      (province ?other)
      (pain ?obj)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain ?obj))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Feast: requires a craving relation craves(?who,?whom), province on the who object, and harmony.
  ;; Effects: produces pain on the who object and gives province to the whom object.
  ;; Removes the craving relation, the province on the who, and harmony.
  ;; Advances the stage from ?s to ?s2.
  (:action feast
    :parameters (?who - thing ?whom - thing ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?who ?whom)
      (province ?who)
      (harmony)
      (succ ?s ?s2)
      (at-stage ?s)
    )
    :effect (and
      (pain ?who)
      (province ?whom)
      (not (craves ?who ?whom))
      (not (province ?who))
      (not (harmony))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)