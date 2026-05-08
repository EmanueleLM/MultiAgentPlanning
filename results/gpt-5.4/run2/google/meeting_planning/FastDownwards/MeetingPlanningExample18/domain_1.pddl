(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler friend location time meet_stage
  )

  (:constants
    marina_district richmond_district - location
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (friend_at ?f - friend ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (advance_11 ?t1 - time ?t2 - time)
    (advance_9 ?t1 - time ?t2 - time)
    (betty_available ?t - time)
    (meeting_progress ?s - meet_stage)
    (next_stage ?s1 - meet_stage ?s2 - meet_stage)
  )

  (:action wait_one_minute
    :parameters (?p - traveler ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_marina_to_richmond
    :parameters (?p - traveler ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p marina_district)
      (current_time ?t1)
      (advance_11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?p marina_district))
      (at ?p richmond_district)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_richmond_to_marina
    :parameters (?p - traveler ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p richmond_district)
      (current_time ?t1)
      (advance_9 ?t1 ?t2)
    )
    :effect (and
      (not (at ?p richmond_district))
      (at ?p marina_district)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_betty_one_minute
    :parameters (?p - traveler ?f - friend ?t1 - time ?t2 - time ?s1 - meet_stage ?s2 - meet_stage)
    :precondition (and
      (at ?p richmond_district)
      (friend_at ?f richmond_district)
      (current_time ?t1)
      (next ?t1 ?t2)
      (betty_available ?t1)
      (meeting_progress ?s1)
      (next_stage ?s1 ?s2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?s1))
      (meeting_progress ?s2)
    )
  )
)