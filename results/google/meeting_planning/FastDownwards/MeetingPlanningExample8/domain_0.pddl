(define (domain meeting-orchestration)
  (:requirements :strips :typing :equality)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (can-travel ?from - location ?to - location ?tdep - time ?tarr - time)
    (can-meet ?tstart - time ?tend - time)
    (met ?a - person ?b - person)
  )

  ;; Traveler-specific travel: Chinatown -> Marina
  (:action traveler-travel-chinatown-to-marina
    :parameters (?tdep ?tarr ?tend - time)
    :precondition (and
      (at traveler chinatown ?tdep)
      (can-travel chinatown marina ?tdep ?tarr)
      ;; ensure the arrival time leads into a known meeting window so the traveler can be present at meeting end
      (can-meet ?tarr ?tend)
    )
    :effect (and
      (not (at traveler chinatown ?tdep))
      (at traveler marina ?tarr)
      ;; mark traveler present at meeting end time as well so meeting of duration can be modeled
      (at traveler marina ?tend)
    )
  )

  ;; Traveler-specific travel: Marina -> Chinatown
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

  ;; Stephanie's travel action (keeps action distinct from traveler's actions)
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

  ;; Meeting action: both must be at Marina at meeting start and meeting end,
  ;; and the meeting window must be allowed by can-meet.
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