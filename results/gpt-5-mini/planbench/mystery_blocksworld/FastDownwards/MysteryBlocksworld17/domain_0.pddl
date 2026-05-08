(define (domain struggle)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)        ; object currently holds a province
    (planet ?o - obj)          ; object corresponds to an intact planet
    (craves ?s - obj ?t - obj) ; s craves t
    (wound ?o - obj)           ; o is wounded (Pain tied to a specific object)
    (harmony)                  ; global harmony flag
  )

  ;; Attack requires a specific province object, a specific planet object, and harmony.
  ;; It wounds the province object, clears that province and the chosen planet, and clears harmony.
  (:action Attack
    :parameters (?p - obj ?l - obj)
    :precondition (and (harmony) (province ?p) (planet ?l))
    :effect (and
      (wound ?p)
      (not (province ?p))
      (not (planet ?l))
      (not (harmony))
    )
  )

  ;; Feast requires a specific craving (s craves t), that s currently has a province, and harmony.
  ;; It produces a wound on s (Pain tied to s), transfers province to t, and clears the craving, s's province and harmony.
  (:action Feast
    :parameters (?s - obj ?t - obj)
    :precondition (and (craves ?s ?t) (province ?s) (harmony))
    :effect (and
      (wound ?s)
      (province ?t)
      (not (craves ?s ?t))
      (not (province ?s))
      (not (harmony))
    )
  )

  ;; Succumb requires a wound on an object and restores that object's province and planet and re-establishes harmony;
  ;; it removes the wound (consumes the Pain tied to that object).
  (:action Succumb
    :parameters (?o - obj)
    :precondition (wound ?o)
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (wound ?o))
    )
  )

  ;; Overcome requires that some other object holds a province (the "other" object) and a wound tied to the subject object.
  ;; It consumes the other object's province and the wound on the subject, re-establishes harmony,
  ;; grants the subject a province, and makes the subject crave the other object.
  (:action Overcome
    :parameters (?s - obj ?other - obj)
    :precondition (and (province ?other) (wound ?s))
    :effect (and
      (harmony)
      (province ?s)
      (craves ?s ?other)
      (not (province ?other))
      (not (wound ?s))
    )
  )
)