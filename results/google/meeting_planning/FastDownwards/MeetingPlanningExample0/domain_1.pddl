(define (domain travel-meetings-classical)
  (:requirements :strips :typing :action-costs)
  (:types person location timepoint)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person ?q - person)
    (time ?t - timepoint)
  )
  (:functions
    (total-cost)
  )

  (:action advance-540-610
    :precondition (time t540)
    :effect (and
      (not (time t540))
      (time t610)
    )
  )

  (:action advance-610-630
    :precondition (time t610)
    :effect (and
      (not (time t610))
      (time t630)
    )
  )

  (:action advance-630-670
    :precondition (time t630)
    :effect (and
      (not (time t630))
      (time t670)
    )
  )

  (:action advance-670-690
    :precondition (time t670)
    :effect (and
      (not (time t670))
      (time t690)
    )
  )

  (:action advance-690-750
    :precondition (time t690)
    :effect (and
      (not (time t690))
      (time t750)
    )
  )

  (:action advance-750-810
    :precondition (time t750)
    :effect (and
      (not (time t750))
      (time t810)
    )
  )

  (:action travel-marina-to-mission-at-610
    :precondition (and
      (at traveler MarinaDistrict)
      (time t610)
    )
    :effect (and
      (not (at traveler MarinaDistrict))
      (at traveler MissionDistrict)
      (not (time t610))
      (time t630)
      (increase (total-cost) 20)
    )
  )

  (:action travel-marina-to-mission-at-670
    :precondition (and
      (at traveler MarinaDistrict)
      (time t670)
    )
    :effect (and
      (not (at traveler MarinaDistrict))
      (at traveler MissionDistrict)
      (not (time t670))
      (time t690)
      (increase (total-cost) 20)
    )
  )

  (:action meet-630-750
    :precondition (and
      (at traveler MissionDistrict)
      (at stephanie MissionDistrict)
      (time t630)
    )
    :effect (and
      (met traveler stephanie)
      (not (time t630))
      (time t750)
      (increase (total-cost) 120)
    )
  )

  (:action meet-690-810
    :precondition (and
      (at traveler MissionDistrict)
      (at stephanie MissionDistrict)
      (time t690)
    )
    :effect (and
      (met traveler stephanie)
      (not (time t690))
      (time t810)
      (increase (total-cost) 120)
    )
  )

)