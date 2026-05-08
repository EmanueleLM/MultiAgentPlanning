(define (domain mystery-blocksworld4)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
  )

  ;; Attack: requires a province, a planet, and harmony.
  ;; Effects: the specified object gets pain; the given province and planet facts and harmony are removed.
  (:action attack
    :parameters (?obj - object ?pl - object)
    :precondition (and (province ?obj) (planet ?pl) (harmony))
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: requires an object in pain.
  ;; Effects: restores a province for that object, establishes a planet (parameter), restores harmony, removes pain.
  (:action succumb
    :parameters (?obj - object ?pl - object)
    :precondition (and (pain ?obj))
    :effect (and
      (province ?obj)
      (planet ?pl)
      (harmony)
      (not (pain ?obj))
    )
  )

  ;; Overcome: requires that some other object currently holds a province and that the subject is in pain.
  ;; Effects: creates harmony, makes the subject a province-holder, creates a craves relation from subject to the other,
  ;; and removes the other object's province and the subject's pain.
  (:action overcome
    :parameters (?sub - object ?other - object)
    :precondition (and (province ?other) (pain ?sub))
    :effect (and
      (harmony)
      (province ?sub)
      (craves ?sub ?other)
      (not (province ?other))
      (not (pain ?sub))
    )
  )

  ;; Feast: requires that the subject craves the other, subject is a province-holder, and harmony holds.
  ;; Effects: subject becomes in pain, the other gains province status;
  ;; removes the subject's craves link, the subject's province, and harmony.
  (:action feast
    :parameters (?sub - object ?other - object)
    :precondition (and (craves ?sub ?other) (province ?sub) (harmony))
    :effect (and
      (pain ?sub)
      (province ?other)
      (not (craves ?sub ?other))
      (not (province ?sub))
      (not (harmony))
    )
  )
)