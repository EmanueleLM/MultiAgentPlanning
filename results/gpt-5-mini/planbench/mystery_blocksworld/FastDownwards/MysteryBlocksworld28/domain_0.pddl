(define (domain craving-transfer)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?o - obj)       ; object ?o currently holds a province
    (planet ?o - obj)         ; object ?o is a planet
    (craves ?x - obj ?y - obj); object ?x craves object ?y
    (pain ?o - obj)           ; object ?o is in pain
    (harmony)                 ; global harmony token
  )

  ;; Attack action (actor-centric)
  ;; Preconditions: actor holds a province AND is a planet AND global harmony exists.
  ;; Effects: actor becomes pained; actor loses province and planet; harmony is removed.
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

  ;; Feast action (actor feasts on other)
  ;; Preconditions: actor craves other, actor holds a province, and harmony exists.
  ;; Effects: actor becomes pained; province transferred to other; the craves relation is removed; harmony is removed.
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

  ;; Succumb action (actor recovers)
  ;; Preconditions: actor is in pain.
  ;; Effects: actor regains province and planet; harmony is restored; pain removed.
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

  ;; Overcome action (actor overcomes using province of other)
  ;; Preconditions: actor in pain; other holds province.
  ;; Effects: harmony restored; province transferred to actor; actor now craves other; other loses province; actor no longer in pain.
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