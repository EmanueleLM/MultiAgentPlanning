(define (domain craving-transfer)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)        ; object ?o currently holds a province
    (planet ?o - obj)          ; object ?o is a planet
    (craves ?x - obj ?y - obj) ; object ?x craves object ?y
    (pain ?o - obj)            ; object ?o is in pain
    (harmony)                  ; global harmony token
  )

  ;; Attack: requires an object to have a province and be a planet, and global harmony.
  ;; Effects: object gains pain; loses province and planet; harmony is removed.
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

  ;; Feast: actor ?x feasts on ?y.
  ;; Requires: (craves ?x ?y), (province ?x), (harmony).
  ;; Effects: ?x gains pain; province transferred to ?y; craves relation removed; harmony removed.
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

  ;; Succumb: actor recovers from pain.
  ;; Requires: (pain ?x).
  ;; Effects: actor regains province and planet; harmony restored; pain removed.
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

  ;; Overcome: actor ?x overcomes using province of ?y.
  ;; Requires: (pain ?x) and (province ?y).
  ;; Effects: harmony restored; province transferred to ?x; ?x craves ?y; ?y loses province; ?x no longer in pain.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )
)