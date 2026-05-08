(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)        ; object currently holds a province
    (planet ?o - obj)          ; object corresponds to an intact planet
    (craves ?s - obj ?t - obj) ; s craves t
    (pain ?o - obj)            ; pain associated with object
    (harmony)                  ; global harmony flag
  )

  ;; Attack: requires a province-holder object, a planet object, and harmony.
  ;; Effects: the province-holder suffers pain, its province is removed,
  ;;          the specified planet is removed, and harmony is lost.
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

  ;; Feast: an object s that craves t and currently holds a province can feast
  ;; on t when harmony holds. Results: s gains pain, t gains a province,
  ;; the craving is consumed, s loses its province, and harmony is lost.
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

  ;; Succumb: consumes pain on an object and restores that object's province,
  ;; planet status, and global harmony.
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

  ;; Overcome: an object s that is in pain can overcome if some other object
  ;; holds a province. This produces harmony, gives s a province, makes s crave
  ;; the other object, and removes the other object's province and s's pain.
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