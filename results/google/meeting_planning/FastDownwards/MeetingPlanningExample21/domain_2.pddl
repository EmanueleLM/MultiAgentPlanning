(define (domain sf_meeting_margaret)
  (:requirements :strips :typing)
  (:types location person)
  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (chosen_departure_0900)
    (arrived_0912)
    (slot_0912_1545_available ?p - person ?l - location)
    (met ?p - person)
  )

  (:action move_mission_to_haight
    :parameters ()
    :precondition (and
      (at Mission_District)
      (chosen_departure_0900)
    )
    :effect (and
      (not (at Mission_District))
      (at Haight_Ashbury)
      (arrived_0912)
    )
  )

  (:action meet_margaret_30
    :parameters ()
    :precondition (and
      (at Haight_Ashbury)
      (arrived_0912)
      (person_at margaret Haight_Ashbury)
      (slot_0912_1545_available margaret Haight_Ashbury)
    )
    :effect (met margaret)
  )
)