(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x ?y - obj)
    (pain ?x - obj)
    (harmony)
    (current ?t - stage)
    (succ ?t1 ?t2 - stage)
  )

  ;; Attack: requires the object to be both a province and a planet, and harmony.
  ;; Produces pain on that object and removes its province/planet and harmony.
  ;; Time progression enforced explicitly via current/succ.
  (:action Attack
    :parameters (?x - obj ?t - stage ?t2 - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Succumb: resolves pain on an object, restoring province, planet, and harmony.
  (:action Succumb
    :parameters (?x - obj ?t - stage ?t2 - stage)
    :precondition (and
      (pain ?x)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Overcome: requires province on the "other" object and pain on the subject.
  ;; Produces harmony, gives province to the subject, and creates a craves relation subject->other.
  ;; Removes the other's province and the subject's pain.
  (:action Overcome
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (province ?y)
      (pain ?x)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Feast: subject feasts from the other object (subject -> other).
  ;; Requires an existing craves relation subject->other, the subject being a province, and harmony.
  ;; As specified: "Pain object, Province other object."
  ;; We interpret this as: the subject experiences pain (pain ?x) and the other gains province (province ?y).
  ;; Feast deletes the craves relation, the subject's province, and harmony.
  (:action Feast
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?t))
      (current ?t2)
    )
  )
)