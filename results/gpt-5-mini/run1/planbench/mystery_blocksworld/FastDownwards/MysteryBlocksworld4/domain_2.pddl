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

  ;; Attack: act on a single object that must be both a province and a planet, with harmony.
  ;; Effects: that object becomes in pain and loses province, planet and harmony.
  (:action attack
    :parameters (?obj - object)
    :precondition (and (province ?obj) (planet ?obj) (harmony))
    :effect (and
      (pain ?obj)
      (not (province ?obj))
      (not (planet ?obj))
      (not (harmony))
    )
  )

  ;; Succumb: the object in pain recovers province and planet and restores harmony; pain removed.
  (:action succumb
    :parameters (?obj - object)
    :precondition (and (pain ?obj))
    :effect (and
      (province ?obj)
      (planet ?obj)
      (harmony)
      (not (pain ?obj))
    )
  )

  ;; Overcome: a subject in pain overcomes some other object that currently holds a province.
  ;; Effects: creates harmony, makes the subject a province-holder, creates a craving from subject to other,
  ;; and removes the other's province and the subject's pain.
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

  ;; Feast: subject that craves other, is a province-holder, and harmony holds, feasts on the other.
  ;; Effects: subject becomes in pain, the other gains province; removes the craves link, the subject's province, and harmony.
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