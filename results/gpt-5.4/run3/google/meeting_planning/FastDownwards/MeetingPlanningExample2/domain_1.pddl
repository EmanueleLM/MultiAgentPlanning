(define (domain san_francisco_jessica_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meeting_stage
  )

  (:constants
    traveler jessica - person
    m0 m1 m2 m3 m4 m5 m6 - meeting_stage
    haight_ashbury sunset_district - location
  )

  (:predicates
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (at ?p - person ?l - location)
    (connected ?from - location ?to - location)
    (available ?p - person ?t - time)
    (meeting_progress ?s - meeting_stage)
    (meeting_next ?s1 - meeting_stage ?s2 - meeting_stage)
    (met_minimum ?p - person)
  )

  (:action wait_before_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress m0)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait_after_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress m6)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action move_before_meeting
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress m0)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action move_after_meeting
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_progress m6)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action progress_meeting
    :parameters (?s1 - meeting_stage ?s2 - meeting_stage ?t1 - time ?t2 - time)
    :precondition (and
      (meeting_progress ?s1)
      (meeting_next ?s1 ?s2)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at traveler sunset_district)
      (at jessica sunset_district)
      (available jessica ?t1)
      (not (meeting_progress m6))
    )
    :effect (and
      (not (meeting_progress ?s1))
      (meeting_progress ?s2)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action progress_meeting_final
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_progress m5)
      (meeting_next m5 m6)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at traveler sunset_district)
      (at jessica sunset_district)
      (available jessica ?t1)
      (not (met_minimum jessica))
    )
    :effect (and
      (not (meeting_progress m5))
      (meeting_progress m6)
      (met_minimum jessica)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)