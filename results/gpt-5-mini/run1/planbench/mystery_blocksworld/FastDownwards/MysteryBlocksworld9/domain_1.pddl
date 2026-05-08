(define (domain craving-domain)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?from - obj ?to - obj)
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
  )

  ;; Attack an object: requires that the object is a province, is a planet, and harmony holds.
  ;; Effects: the object becomes in pain; it ceases being a province and a planet; harmony is lost.
  (:action attack
    :parameters (?o - obj)
    :precondition (and (province ?o) (planet ?o) (harmony))
    :effect (and (pain ?o)
                 (not (province ?o))
                 (not (planet ?o))
                 (not (harmony)))
  )

  ;; Succumb: an object in pain regains province, planet and restores harmony.
  ;; Effects: pain on the object is removed; province, planet and harmony are added.
  (:action succumb
    :parameters (?o - obj)
    :precondition (and (pain ?o))
    :effect (and (province ?o)
                 (planet ?o)
                 (harmony)
                 (not (pain ?o)))
  )

  ;; Overcome: an object with pain overcomes another province object.
  ;; Preconditions: the acting object is in pain and the other object is a province.
  ;; Effects: harmony is restored, the acting object becomes a province, and the acting object craves the other.
  ;; Removes the other's province status and the acting object's pain.
  (:action overcome
    :parameters (?actor - obj ?other - obj)
    :precondition (and (pain ?actor) (province ?other))
    :effect (and (harmony)
                 (province ?actor)
                 (craves ?actor ?other)
                 (not (province ?other))
                 (not (pain ?actor)))
  )

  ;; Feast: an object that craves another and is a province feasts from that other while harmony holds.
  ;; Preconditions: craves(actor,other), province(actor), harmony.
  ;; Effects: actor gains pain, the other becomes a province; removes the craves relation, actor's province status, and harmony.
  (:action feast
    :parameters (?actor - obj ?other - obj)
    :precondition (and (craves ?actor ?other) (province ?actor) (harmony))
    :effect (and (pain ?actor)
                 (province ?other)
                 (not (craves ?actor ?other))
                 (not (province ?actor))
                 (not (harmony)))
  )
)