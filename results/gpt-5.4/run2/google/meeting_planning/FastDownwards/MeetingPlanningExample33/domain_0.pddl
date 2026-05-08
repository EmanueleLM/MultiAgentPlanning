(define (domain san_francisco_meet_sarah)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    friend
    location
    time
  )

  (:predicates
    (at ?trav - traveler ?loc - location)
    (current_time ?t - time)
    (travel_link ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_link ?loc - location ?t1 - time ?t2 - time)
    (available ?fr - friend ?loc - location ?t - time)
    (meeting_started ?fr - friend)
    (met ?fr - friend)
  )

  (:action travel
    :parameters (?trav - traveler ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?trav ?from)
      (current_time ?t1)
      (travel_link ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?trav ?from))
      (at ?trav ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?trav - traveler ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?trav ?loc)
      (current_time ?t1)
      (wait_link ?loc ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?trav - traveler ?fr - friend ?loc - location ?t - time)
    :precondition (and
      (at ?trav ?loc)
      (current_time ?t)
      (available ?fr ?loc ?t)
      (not (meeting_started ?fr))
      (not (met ?fr))
    )
    :effect (and
      (meeting_started ?fr)
    )
  )

  (:action finish_meeting_after_wait
    :parameters (?trav - traveler ?fr - friend ?loc - location ?t - time)
    :precondition (and
      (at ?trav ?loc)
      (current_time ?t)
      (available ?fr ?loc ?t)
      (meeting_started ?fr)
      (not (met ?fr))
    )
    :effect (and
      (met ?fr)
      (not (meeting_started ?fr))
    )
  )
)