(define (domain sf-day-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent friend location minute count
  )

  (:predicates
    (time ?m - minute)
    (next ?m1 - minute ?m2 - minute)

    (at ?a - agent ?l - location)

    (john-available-at ?m - minute)
    (john-window-start ?m - minute)
    (day-end ?m - minute)

    (plus21 ?m-depart - minute ?m-arrive - minute)
    (plus19 ?m-depart - minute ?m-arrive - minute)

    (in-transit-out)
    (in-transit-in)
    (arrive-out-at ?m - minute)
    (arrive-in-at ?m - minute)

    (met-count ?c - count)
    (count-next ?c1 - count ?c2 - count)
  )

  (:action advance-time
    :parameters (?t - minute ?t2 - minute)
    :precondition (and
      (time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
    )
  )

  (:action depart-rh-ggp
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a russian_hill)
      (time ?t)
      (plus21 ?t ?arr)
      (john-window-start ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a russian_hill))
      (in-transit-out)
      (arrive-out-at ?arr)
    )
  )

  (:action arrive-ggp
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (in-transit-out)
      (time ?t)
      (arrive-out-at ?t)
    )
    :effect (and
      (at ?a golden_gate_park)
      (not (in-transit-out))
      (not (arrive-out-at ?t))
    )
  )

  (:action meet-minute
    :parameters (?a - agent ?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (met-count ?c)
      (count-next ?c ?c2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (met-count ?c))
      (met-count ?c2)
    )
  )

  (:action depart-ggp-rh
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (plus19 ?t ?arr)
      (day-end ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a golden_gate_park))
      (in-transit-in)
      (arrive-in-at ?arr)
    )
  )

  (:action arrive-rh
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (in-transit-in)
      (time ?t)
      (arrive-in-at ?t)
    )
    :effect (and
      (at ?a russian_hill)
      (not (in-transit-in))
      (not (arrive-in-at ?t))
    )
  )
)