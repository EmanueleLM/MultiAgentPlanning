(define (domain mission_haight_meet)
  (:requirements :strips :typing)
  (:types location person)
  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (available_slot ?p - person ?l - location)
    (arrived_on_time)
    (met ?p - person)
  )

  (:action move_mission_to_haight
    :precondition (at Mission_District)
    :effect (and
      (not (at Mission_District))
      (at Haight_Ashbury)
      (arrived_on_time)
    )
  )

  (:action meet_margaret_30
    :precondition (and
      (at Haight_Ashbury)
      (person_at margaret Haight_Ashbury)
      (available_slot margaret Haight_Ashbury)
      (arrived_on_time)
    )
    :effect (met margaret)
  )
)