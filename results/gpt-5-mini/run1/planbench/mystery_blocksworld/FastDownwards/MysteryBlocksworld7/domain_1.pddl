(define (domain mystery-craving)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
    (craves ?from - obj ?to - obj)
  )

  ; Attack an object that has both a province and a planet while global harmony holds.
  ; Effects: that object becomes in pain, and its province and planet and the global harmony are removed.
  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ; Succumb: an object in pain restores its province and planet and global harmony, and stops being in pain.
  (:action succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ; Overcome: subject ?x overcomes with respect to other ?y.
  ; Requires: other ?y has a province and subject ?x is in pain.
  ; Effects: harmony is set, subject ?x gains a province, subject ?x comes to crave ?y;
  ;         other ?y loses its province; subject ?x stops being in pain.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ; Feast: subject ?x consumes its craving for other ?y when subject has a province and harmony holds.
  ; Effects: subject ?x becomes in pain, other ?y gains a province, the craves relation (x->y) is removed,
  ;          subject ?x loses its province, and harmony is removed.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)