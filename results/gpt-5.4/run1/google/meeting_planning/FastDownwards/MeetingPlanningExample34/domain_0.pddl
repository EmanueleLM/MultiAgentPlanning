(define (domain san_francisco_thomas_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (travel_departure ?from - location ?to - location ?t_from - timepoint)
    (travel_arrival ?from - location ?to - location ?t_to - timepoint)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?t_start - timepoint ?t_end - timepoint)
    (meeting_start_option ?p - person ?t - timepoint)
    (meeting_end_option ?p - person ?t - timepoint)
    (meeting_in_progress ?p - person)
    (met_required ?p - person)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_from - timepoint ?t_to - timepoint)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t_from)
      (travel_departure ?from ?to ?t_from)
      (travel_arrival ?from ?to ?t_to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_from))
      (current_time ?t_to)
    )
  )

  (:action start_required_meeting
    :parameters (?p - person ?t - timepoint)
    :precondition (and
      (at pacific_heights)
      (current_time ?t)
      (meeting_start_option ?p ?t)
      (not (meeting_in_progress ?p))
      (not (met_required ?p))
    )
    :effect (and
      (meeting_in_progress ?p)
    )
  )

  (:action finish_required_meeting
    :parameters (?p - person ?t - timepoint)
    :precondition (and
      (at pacific_heights)
      (current_time ?t)
      (meeting_in_progress ?p)
      (meeting_end_option ?p ?t)
    )
    :effect (and
      (not (meeting_in_progress ?p))
      (met_required ?p)
    )
  )
)