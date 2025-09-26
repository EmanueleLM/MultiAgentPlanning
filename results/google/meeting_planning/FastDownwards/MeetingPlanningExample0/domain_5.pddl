(define (domain travel-meetings-classical)
  (:requirements :strips :typing)
  (:types person location timepoint)
  (:constants t540 t610 t630 t670 t690 t750 t810 - timepoint)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
    (time ?t - timepoint)
  )

  (:action advance-540-610
    :parameters ()
    :precondition (time t540)
    :effect (and
      (not (time t540))
      (time t610)
    )
  )

  (:action advance-610-630
    :parameters ()
    :precondition (time t610)
    :effect (and
      (not (time t610))
      (time t630)
    )
  )

  (:action advance-630-670
    :parameters ()
    :precondition (time t630)
    :effect (and
      (not (time t630))
      (time t670)
    )
  )

  (:action advance-670-690
    :parameters ()
    :precondition (time t670)
    :effect (and
      (not (time t670))
      (time t690)
    )
  )

  (:action advance-690-750
    :parameters ()
    :precondition (time t690)
    :effect (and
      (not (time t690))
      (time t750)
    )
  )

  (:action advance-750-810
    :parameters ()
    :precondition (time t750)
    :effect (and
      (not (time t750))
      (time t810)
    )
  )

  (:action travel-marina-to-mission-at-610
    :parameters ()
    :precondition (and
      (at traveler marina_district)
      (time t610)
    )
    :effect (and
      (not (at traveler marina_district))
      (at traveler mission_district)
      (not (time t610))
      (time t630)
    )
  )

  (:action travel-marina-to-mission-at-670
    :parameters ()
    :precondition (and
      (at traveler marina_district)
      (time t670)
    )
    :effect (and
      (not (at traveler marina_district))
      (at traveler mission_district)
      (not (time t670))
      (time t690)
    )
  )

  (:action meet-630-750
    :parameters ()
    :precondition (and
      (at traveler mission_district)
      (at stephanie mission_district)
      (time t630)
    )
    :effect (and
      (met traveler stephanie)
      (not (time t630))
      (time t750)
    )
  )

  (:action meet-690-810
    :parameters ()
    :precondition (and
      (at traveler mission_district)
      (at stephanie mission_district)
      (time t690)
    )
    :effect (and
      (met traveler stephanie)
      (not (time t690))
      (time t810)
    )
  )

)