(define (domain san_francisco_meet_betty)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - timepoint)
    (met ?f - person)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (travel_arrives ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (available ?f - person ?start - timepoint ?end - timepoint)
    (meeting_slot ?f - person ?start - timepoint ?end - timepoint)
  )

  (:action move
    :parameters (?p - person ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?p ?from)
      (current_time ?depart)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
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

  (:action meet_friend
    :parameters (?f - person ?loc - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at traveler ?loc)
      (at ?f ?loc)
      (current_time ?start)
      (available ?f ?start t_9_45_pm)
      (meeting_slot ?f ?start ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?f)
    )
  )
)