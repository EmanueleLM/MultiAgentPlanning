(define (domain meetingplanningexample39)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    time
  )

  (:predicates
    (at ?l - location)
    (free)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (available_stephanie ?t - time)
    (meeting_started)
    (met_stephanie)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (not (meeting_started))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (free)
      (at ?from)
      (current ?depart)
      (next ?depart ?arrive)
      (connected ?from ?to)
      (not (meeting_started))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?depart))
      (current ?arrive)
    )
  )

  (:action start_meeting_stephanie
    :parameters (?t - time)
    :precondition (and
      (free)
      (at nob_hill)
      (current ?t)
      (available_stephanie ?t)
      (not (meeting_started))
      (not (met_stephanie))
    )
    :effect (and
      (not (free))
      (meeting_started)
    )
  )

  (:action continue_meeting_stephanie
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_started)
      (at nob_hill)
      (current ?t1)
      (next ?t1 ?t2)
      (available_stephanie ?t1)
      (available_stephanie ?t2)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action finish_meeting_stephanie
    :parameters (?t - time)
    :precondition (and
      (meeting_started)
      (at nob_hill)
      (current ?t)
    )
    :effect (and
      (free)
      (not (meeting_started))
      (met_stephanie)
    )
  )
)