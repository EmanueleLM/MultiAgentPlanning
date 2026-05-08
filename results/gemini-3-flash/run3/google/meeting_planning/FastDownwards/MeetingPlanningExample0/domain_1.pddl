(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types
    location time count
  )
  (:constants
    marina_district mission_district - location
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met_for ?c - count)
    (next_t ?t1 ?t2 - time)
    (next_c ?c1 ?c2 - count)
    (plus20 ?t1 ?t2 - time)
    (plus19 ?t1 ?t2 - time)
    (stephanie_at_mission ?t - time)
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (time_at ?t1)
      (next_t ?t1 ?t2)
    )
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action move_marina_to_mission
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at marina_district)
      (time_at ?t1)
      (plus20 ?t1 ?t2)
    )
    :effect (and
      (not (at marina_district))
      (at mission_district)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action move_mission_to_marina
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at mission_district)
      (time_at ?t1)
      (plus19 ?t1 ?t2)
    )
    :effect (and
      (not (at mission_district))
      (at marina_district)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action meet_stephanie
    :parameters (?t1 ?t2 - time ?c1 ?c2 - count)
    :precondition (and
      (at mission_district)
      (time_at ?t1)
      (next_t ?t1 ?t2)
      (stephanie_at_mission ?t1)
      (met_for ?c1)
      (next_c ?c1 ?c2)
    )
    :effect (and
      (not (time_at ?t1))
      (time_at ?t2)
      (not (met_for ?c1))
      (met_for ?c2)
    )
  )
)