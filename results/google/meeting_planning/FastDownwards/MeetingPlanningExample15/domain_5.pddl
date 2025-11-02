(define (domain sf-day-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent friend location minute count)
  (:constants
    russian_hill golden_gate_park - location
  )
  (:functions
    (total-cost)
  )
  (:predicates
    (time ?m - minute)
    (next ?m1 - minute ?m2 - minute)
    (at ?a - agent ?l - location)
    (john-available-at ?m - minute)
    (plus21 ?m-depart - minute ?m-arrive - minute)
    (plus19 ?m-depart - minute ?m-arrive - minute)
    (in-transit-out)
    (in-transit-in)
    (arrive-out-at ?m - minute)
    (arrive-in-at ?m - minute)
    (met-count ?c - count)
    (count-next-pre90 ?c1 - count ?c2 - count)
    (count-next-90 ?c1 - count ?c2 - count)
    (in-meeting)
    (met-at-least-90)
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
      (not (in-meeting))
      (increase (total-cost) 1)
    )
  )

  (:action depart-rh-ggp
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a russian_hill)
      (time ?t)
      (plus21 ?t ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a russian_hill))
      (in-transit-out)
      (arrive-out-at ?arr)
      (not (in-meeting))
      (increase (total-cost) 1)
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

  (:action meet-minute-start
    :parameters (?a - agent ?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (not (in-transit-out))
      (not (in-transit-in))
      (not (in-meeting))
      (met-count ?c)
      (count-next-pre90 ?c ?c2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (met-count ?c))
      (met-count ?c2)
      (in-meeting)
    )
  )

  (:action meet-minute-continue
    :parameters (?a - agent ?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (not (in-transit-out))
      (not (in-transit-in))
      (in-meeting)
      (met-count ?c)
      (count-next-pre90 ?c ?c2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (met-count ?c))
      (met-count ?c2)
      (in-meeting)
    )
  )

  (:action meet-minute-reach90
    :parameters (?a - agent ?t - minute ?t2 - minute ?c - count ?c2 - count)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (not (in-transit-out))
      (not (in-transit-in))
      (in-meeting)
      (met-count ?c)
      (count-next-90 ?c ?c2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (met-count ?c))
      (met-count ?c2)
      (in-meeting)
      (met-at-least-90)
    )
  )

  (:action meet-minute-after90
    :parameters (?a - agent ?t - minute ?t2 - minute)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (next ?t ?t2)
      (john-available-at ?t)
      (not (in-transit-out))
      (not (in-transit-in))
      (in-meeting)
      (met-at-least-90)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (in-meeting)
    )
  )

  (:action depart-ggp-rh
    :parameters (?a - agent ?t - minute ?arr - minute)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (plus19 ?t ?arr)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a golden_gate_park))
      (in-transit-in)
      (arrive-in-at ?arr)
      (not (in-meeting))
      (increase (total-cost) 1)
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