(define (domain san_francisco_sarah_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (person_at ?p - person ?l - location)
    (available ?p - person ?t - timepoint)
    (meeting_started ?p - person)
    (met_minimum ?p - person)
  )

  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (not (meeting_started sarah))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (not (meeting_started sarah))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting_with_sarah
    :parameters ()
    :precondition (and
      (current_time t_1315)
      (at presidio)
      (person_at sarah presidio)
      (available sarah t_1315)
      (not (meeting_started sarah))
      (not (met_minimum sarah))
    )
    :effect (and
      (meeting_started sarah)
    )
  )

  (:action elapse_meeting_to_minimum
    :parameters ()
    :precondition (and
      (current_time t_1315)
      (meeting_started sarah)
      (at presidio)
      (person_at sarah presidio)
      (available sarah t_1315)
      (available sarah t_1500)
    )
    :effect (and
      (not (current_time t_1315))
      (current_time t_1500)
    )
  )

  (:action finish_meeting_with_sarah
    :parameters ()
    :precondition (and
      (current_time t_1500)
      (meeting_started sarah)
      (at presidio)
      (person_at sarah presidio)
      (available sarah t_1500)
    )
    :effect (and
      (met_minimum sarah)
      (not (meeting_started sarah))
    )
  )
)