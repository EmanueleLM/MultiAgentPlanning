(define (domain san_francisco_meet_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place person time
  )

  (:predicates
    (at ?p - place)
    (connected ?from - place ?to - place)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (john_at ?person - person ?place - place)
    (john_available)
    (met_minimum ?person - person)
  )

  (:action travel_richmond_to_north_beach_t0900_t0917
    :parameters ()
    :precondition (and
      (at richmond_district)
      (current_time t0900)
      (connected richmond_district north_beach)
    )
    :effect (and
      (not (at richmond_district))
      (at north_beach)
      (not (current_time t0900))
      (current_time t0917)
    )
  )

  (:action wait_at_north_beach_t0917_t1515
    :parameters ()
    :precondition (and
      (at north_beach)
      (current_time t0917)
      (next_time t0917 t1515)
      (not (john_available))
    )
    :effect (and
      (not (current_time t0917))
      (current_time t1515)
      (john_available)
    )
  )

  (:action meet_john_for_75_minutes_t1515_t1630
    :parameters ()
    :precondition (and
      (at north_beach)
      (current_time t1515)
      (john_at john north_beach)
      (john_available)
      (not (met_minimum john))
    )
    :effect (and
      (not (current_time t1515))
      (current_time t1630)
      (met_minimum john)
    )
  )

  (:action wait_at_north_beach_t1630_t1715
    :parameters ()
    :precondition (and
      (at north_beach)
      (current_time t1630)
      (next_time t1630 t1715)
      (john_available)
    )
    :effect (and
      (not (current_time t1630))
      (current_time t1715)
      (not (john_available))
    )
  )
)