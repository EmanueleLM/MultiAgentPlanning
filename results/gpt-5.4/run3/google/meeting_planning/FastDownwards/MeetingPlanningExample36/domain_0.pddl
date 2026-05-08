(define (domain san_francisco_barbara_day)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_15 ?t1 - time ?t2 - time)
    (next_30 ?t1 - time ?t2 - time)
    (travel_advance ?from - location ?to - location ?depart - time ?arrive - time)
    (barbara_available_30 ?t - time)
    (met_barbara_first_halfhour)
    (ready_for_second_half)
    (met_barbara_60)
  )

  (:action wait_15
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_15 ?t1 ?t2)
      (not (ready_for_second_half))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_advance ?from ?to ?depart ?arrive)
      (not (ready_for_second_half))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_barbara_first_30
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at embarcadero)
      (current_time ?t1)
      (next_30 ?t1 ?t2)
      (barbara_available_30 ?t1)
      (not (met_barbara_first_halfhour))
      (not (ready_for_second_half))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_barbara_first_halfhour)
      (ready_for_second_half)
    )
  )

  (:action meet_barbara_second_30
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at embarcadero)
      (current_time ?t1)
      (next_30 ?t1 ?t2)
      (barbara_available_30 ?t1)
      (met_barbara_first_halfhour)
      (ready_for_second_half)
      (not (met_barbara_60))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (ready_for_second_half))
      (met_barbara_60)
    )
  )
)