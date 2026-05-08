(define (domain meet_betty_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_11 ?t1 - time ?t2 - time)
    (betty_available ?t - time)
    (meet_start_75 ?t - time)
    (met_betty_75)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (at ?l)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_marina_to_richmond
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (at marina_district)
      (travel_11 ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (at marina_district))
      (at richmond_district)
    )
  )

  (:action meet_betty_for_75
    :parameters (?start - time)
    :precondition (and
      (current_time ?start)
      (at richmond_district)
      (betty_available ?start)
      (meet_start_75 ?start)
      (not (met_betty_75))
    )
    :effect (met_betty_75)
  )
)