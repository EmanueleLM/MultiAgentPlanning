(define (domain meeting_planning_example8)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (current_time ?t - time)
    (traveler_at ?loc - location)
    (stephanie_at ?loc - location)
    (time_after_12 ?t1 - time ?t2 - time)
    (time_after_16 ?t1 - time ?t2 - time)
    (time_after_105 ?t1 - time ?t2 - time)
    (met_stephanie)
  )

  (:action move_chinatown_to_marina
    :parameters (?t_from - time ?t_to - time)
    :precondition (and
      (current_time ?t_from)
      (traveler_at chinatown)
      (time_after_12 ?t_from ?t_to)
    )
    :effect (and
      (not (current_time ?t_from))
      (current_time ?t_to)
      (not (traveler_at chinatown))
      (traveler_at marina_district)
    )
  )

  (:action move_marina_to_chinatown
    :parameters (?t_from - time ?t_to - time)
    :precondition (and
      (current_time ?t_from)
      (traveler_at marina_district)
      (time_after_16 ?t_from ?t_to)
    )
    :effect (and
      (not (current_time ?t_from))
      (current_time ?t_to)
      (not (traveler_at marina_district))
      (traveler_at chinatown)
    )
  )

  (:action meet_stephanie_105
    :parameters (?t_start - time ?t_end - time)
    :precondition (and
      (current_time ?t_start)
      (traveler_at marina_district)
      (stephanie_at marina_district)
      (time_after_105 ?t_start ?t_end)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_stephanie)
    )
  )
)