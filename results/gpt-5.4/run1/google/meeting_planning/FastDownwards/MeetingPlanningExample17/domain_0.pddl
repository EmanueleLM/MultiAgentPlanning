(define (domain meet_matthew_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    friend
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)

    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)

    (friend_at ?f - friend ?l - location)
    (available ?f - friend ?t - time)

    (meeting_started_at ?f - friend ?t - time)
    (meeting_start_to_finish ?start - time ?finish - time)
    (met ?f - friend)
  )

  (:action wait
    :parameters (?from_t - time ?to_t - time ?l - location)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at ?l)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?f - friend ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (friend_at ?f ?l)
      (current_time ?t)
      (available ?f ?t)
      (not (met ?f))
      (not (meeting_started_at ?f t1330))
      (not (meeting_started_at ?f t1345))
      (not (meeting_started_at ?f t1430))
    )
    :effect (and
      (meeting_started_at ?f ?t)
    )
  )

  (:action complete_meeting
    :parameters (?f - friend ?l - location ?start - time ?finish - time)
    :precondition (and
      (meeting_started_at ?f ?start)
      (at ?l)
      (friend_at ?f ?l)
      (current_time ?finish)
      (available ?f ?finish)
      (meeting_start_to_finish ?start ?finish)
      (not (met ?f))
    )
    :effect (and
      (met ?f)
    )
  )
)