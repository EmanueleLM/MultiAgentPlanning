(define (domain meet_jeffrey_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    time
    friend
  )

  (:predicates
    (at ?p - place)
    (current_time ?t - time)
    (met ?f - friend)
    (travel_link ?from - place ?to - place ?t1 - time ?t2 - time)
    (meeting_slot ?f - friend ?p - place ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?from - place ?to - place ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_link ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_friend
    :parameters (?f - friend ?p - place ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p)
      (current_time ?t1)
      (meeting_slot ?f ?p ?t1 ?t2)
      (not (met ?f))
    )
    :effect (and
      (met ?f)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)