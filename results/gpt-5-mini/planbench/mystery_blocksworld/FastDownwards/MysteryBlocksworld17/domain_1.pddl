(define (domain struggle)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)        ; object currently holds a province
    (planet ?o - obj)          ; object corresponds to an intact planet
    (craves ?s - obj ?t - obj) ; s craves t
    (pain ?o - obj)            ; pain associated with object (Pain object)
    (harmony)                  ; global harmony flag
  )

  ;; Attack requires a province on some object p, some planet l, and harmony.
  ;; It causes pain on p, and clears the province on p, the chosen planet l, and harmony.
  (:action attack
    :parameters (?p - obj ?l - obj)
    :precondition (and (harmony) (province ?p) (planet ?l))
    :effect (and
      (pain ?p)
      (not (province ?p))
      (not (planet ?l))
      (not (harmony))
    )
  )

  ;; Feast requires that s craves t, s holds a province, and harmony.
  ;; It causes pain on s, grants the province to t, and clears the craving s->t, s's province, and harmony.
  (:action feast
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

  ;; Succumb consumes pain on an object and restores that object's province, planet, and harmony.
  (:action succumb
    :parameters (?o - obj)
    :precondition (pain ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Overcome requires some other object to hold a province and that the subject s has pain.
  ;; It re-establishes harmony, grants a province to s, makes s crave the other object,
  ;; and consumes the other object's province and s's pain.
  (:action overcome
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