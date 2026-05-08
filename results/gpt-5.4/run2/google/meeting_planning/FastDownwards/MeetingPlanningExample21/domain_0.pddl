(define (domain san_francisco_meet_margaret)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (current_time ?t - time)

    (next ?t1 - time ?t2 - time)
    (plus_11 ?t1 - time ?t2 - time)
    (plus_12 ?t1 - time ?t2 - time)
    (plus_30 ?t1 - time ?t2 - time)

    (margaret_available ?t - time)

    (meeting_active ?p - person)
    (meeting_start ?p - person ?t - time)

    (met_minimum ?p - person)
  )

  (:action travel_mission_to_haight
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at mission_district)
      (current_time ?t1)
      (plus_12 ?t1 ?t2)
      (not (meeting_active margaret))
    )
    :effect (and
      (not (at mission_district))
      (at haight_ashbury)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_haight_to_mission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (current_time ?t1)
      (plus_11 ?t1 ?t2)
      (not (meeting_active margaret))
    )
    :effect (and
      (not (at haight_ashbury))
      (at mission_district)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_margaret
    :parameters (?t - time)
    :precondition (and
      (at haight_ashbury)
      (person_at margaret haight_ashbury)
      (current_time ?t)
      (margaret_available ?t)
      (not (meeting_active margaret))
      (not (met_minimum margaret))
    )
    :effect (and
      (meeting_active margaret)
      (meeting_start margaret ?t)
    )
  )

  (:action continue_meeting_margaret
    :parameters (?t1 - time ?t2 - time ?ts - time)
    :precondition (and
      (meeting_active margaret)
      (meeting_start margaret ?ts)
      (at haight_ashbury)
      (person_at margaret haight_ashbury)
      (current_time ?t1)
      (next ?t1 ?t2)
      (margaret_available ?t1)
      (margaret_available ?t2)
      (not (met_minimum margaret))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action complete_meeting_margaret
    :parameters (?ts - time ?tnow - time)
    :precondition (and
      (meeting_active margaret)
      (meeting_start margaret ?ts)
      (current_time ?tnow)
      (plus_30 ?ts ?tnow)
    )
    :effect (and
      (met_minimum margaret)
    )
  )
)