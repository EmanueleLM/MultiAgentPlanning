(define (domain struggle)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)        ; object currently holds a province
    (planet ?o - obj)          ; object corresponds to an intact planet
    (craves ?s - obj ?t - obj) ; s craves t
    (pain ?o - obj)            ; pain associated with object
    (harmony)                  ; global harmony flag
  )

  (:action attacker_attack
    :parameters (?p - obj ?l - obj)
    :precondition (and (harmony) (province ?p) (planet ?l))
    :effect (and
      (pain ?p)
      (not (province ?p))
      (not (planet ?l))
      (not (harmony))
    )
  )

  (:action feaster_feast
    :parameters (?s - obj ?t - obj)
    :precondition (and (craves ?s ?t) (province ?s) (harmony))
    :effect (and
      (pain ?s)
      (province ?t)
      (not (craves ?s ?t))
      (not (province ?s))
      (not (harmony))
    )
  )

  (:action succumber_succumb
    :parameters (?o - obj)
    :precondition (pain ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcomer_overcome
    :parameters (?s - obj ?other - obj)
    :precondition (and (province ?other) (pain ?s))
    :effect (and
      (harmony)
      (province ?s)
      (craves ?s ?other)
      (not (province ?other))
      (not (pain ?s))
    )
  )
)