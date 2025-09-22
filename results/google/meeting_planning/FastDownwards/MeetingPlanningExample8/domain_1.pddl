(define (domain meeting-orchestration)
  (:requirements :strips :typing :equality)
  (:types person location time)
  (:constants traveler stephanie - person chinatown marina - location)
  (:predicates
    (at ?p - person ?l - location ?t - time)
    (can-travel ?from - location ?to - location ?tdep - time ?tarr - time)
    (can-meet ?tstart - time ?tend - time)
    (met ?a - person ?b - person)
  )
  (:action traveler-travel-chinatown-to-marina
    :parameters (?tdep ?tarr ?tend - time)
    :precondition (and
      (at traveler chinatown ?tdep)
      (can-travel chinatown marina ?tdep ?tarr)
      (can-meet ?tarr ?tend)
    )
    :effect (and
      (not (at traveler chinatown ?tdep))
      (at traveler marina ?tarr)
      (at traveler marina ?tend)
    )
  )
  (:action traveler-travel-marina-to-chinatown
    :parameters (?tdep ?tarr - time)
    :precondition (and
      (at traveler marina ?tdep)
      (can-travel marina chinatown ?tdep ?tarr)
    )
    :effect (and
      (not (at traveler marina ?tdep))
      (at traveler chinatown ?tarr)
    )
  )
  (:action stephanie-travel
    :parameters (?from ?to ?tdep ?tarr ?tend - time)
    :precondition (and
      (at stephanie ?from ?tdep)
      (can-travel ?from ?to ?tdep ?tarr)
      (can-meet ?tarr ?tend)
    )
    :effect (and
      (not (at stephanie ?from ?tdep))
      (at stephanie ?to ?tarr)
      (at stephanie ?to ?tend)
    )
  )
  (:action meet-at-marina
    :parameters (?tstart ?tend - time)
    :precondition (and
      (at stephanie marina ?tstart)
      (at traveler marina ?tstart)
      (at stephanie marina ?tend)
      (at traveler marina ?tend)
      (can-meet ?tstart ?tend)
    )
    :effect (and
      (met stephanie traveler)
    )
  )
)