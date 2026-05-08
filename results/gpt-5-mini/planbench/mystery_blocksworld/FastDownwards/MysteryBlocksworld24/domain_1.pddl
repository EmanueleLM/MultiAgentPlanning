(define (domain mystery-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)          ; object has province property
    (planet ?x - obj)            ; object has planet property
    (harmony)                    ; global harmony flag
    (pain ?x - obj)              ; object is in pain
    (craves ?x - obj ?y - obj)   ; object x craves object y
  )

  ;; Attack: consumes province, planet and harmony on the same object and produces pain on it.
  (:action attacker-attack
    :parameters (?o - obj)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; Succumb: reverses pain into province, planet and harmony on the same object.
  (:action succumber-succumb
    :parameters (?o - obj)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome: requires that some ?other has province and that ?o is in pain.
  ;; Restores harmony, gives province to ?o, makes ?o crave ?other, and removes province from ?other and pain from ?o.
  (:action overcomer-overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: consumes a craving from ?o->?other together with province(?o) and harmony,
  ;; produces pain on ?o and gives province to ?other.
  (:action feaster-feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
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
    )
  )
)