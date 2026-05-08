(define (domain meet_william_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place
    person
    timepoint
  )

  (:predicates
    (at ?p - place)
    (friend_at ?f - person ?p - place)
    (available ?f - person ?t - timepoint)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (travel_arrival ?from - place ?to - place ?depart - timepoint ?arrive - timepoint)
    (met_minimum ?f - person)
    (met_with ?f - person)
  )

  (:action travel
    :parameters (?from - place ?to - place ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
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

  (:action meet_minimum_duration
    :parameters (?f - person ?p - place)
    :precondition (and
      (current_time t1215)
      (at ?p)
      (friend_at ?f ?p)
      (available ?f t1215)
      (not (met_minimum ?f))
    )
    :effect (and
      (not (current_time t1215))
      (current_time t1330)
      (met_minimum ?f)
      (met_with ?f)
    )
  )
)