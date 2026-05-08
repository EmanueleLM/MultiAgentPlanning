(define (domain mystery_blocksworld9)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?o - obj)       ; object holds a province role
    (planet ?o - obj)         ; object holds a planet role
    (harmony)                 ; global boolean flag
    (pain ?o - obj)           ; object is in pain
    (craves ?from - obj ?to - obj) ; binary craving relation
  )

  ;; Attack: combine a province object and a planet object while harmony holds.
  ;; Effects: produce pain on the planet object, remove the specified province and planet,
  ;; and remove harmony.
  (:action attack
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
                    (province ?prov)
                    (planet ?pl)
                    (harmony)
                  )
    :effect (and
              (pain ?pl)
              (not (province ?prov))
              (not (planet ?pl))
              (not (harmony))
            )
  )

  ;; Succumb: an object in pain recovers province, planet, and harmony; pain is removed.
  (:action succumb
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

  ;; Overcome: a painful object can overcome (targeting a province other).
  ;; Preconditions: the target other must currently be a province and the actor must be in pain.
  ;; Effects: add harmony, make the actor a province, create a craving from actor to other,
  ;; and remove the other's province and the actor's pain.
  (:action overcome
    :parameters (?actor - obj ?other - obj)
    :precondition (and
                    (province ?other)
                    (pain ?actor)
                  )
    :effect (and
              (harmony)
              (province ?actor)
              (craves ?actor ?other)
              (not (province ?other))
              (not (pain ?actor))
            )
  )

  ;; Feast: when an object craves another and also is a province while harmony holds,
  ;; it feasts on the other: produce pain on the feaster, grant province to the other,
  ;; and remove the craving, the feaster's province, and harmony.
  (:action feast
    :parameters (?feaster - obj ?other - obj)
    :precondition (and
                    (craves ?feaster ?other)
                    (province ?feaster)
                    (harmony)
                  )
    :effect (and
              (pain ?feaster)
              (province ?other)
              (not (craves ?feaster ?other))
              (not (province ?feaster))
              (not (harmony))
            )
  )
)