(define (domain sf-day-meeting)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent friend location minute count r21 r19)
  (:constants
    russian_hill golden_gate_park - location

    r21_0 r21_1 r21_2 r21_3 r21_4 r21_5 r21_6 r21_7 r21_8 r21_9
    r21_10 r21_11 r21_12 r21_13 r21_14 r21_15 r21_16 r21_17 r21_18 r21_19
    r21_20 r21_21 - r21

    r19_0 r19_1 r19_2 r19_3 r19_4 r19_5 r19_6 r19_7 r19_8 r19_9
    r19_10 r19_11 r19_12 r19_13 r19_14 r19_15 r19_16 r19_17 r19_18 r19_19 - r19
  )

  (:predicates
    (time ?m - minute)
    (next ?m1 - minute ?m2 - minute)
    (at ?a - agent ?l - location)
    (john-available-at ?m - minute)
    (in-transit-out)
    (in-transit-in)
    (out-remaining ?r - r21)
    (in-remaining ?r - r19)
    (dec-r21 ?r1 - r21 ?r2 - r21)
    (dec-r19 ?r1 - r19 ?r2 - r19)
    (in-meeting)
    (met-count ?c - count)
    (count-next-pre90 ?c1 - count ?c2 - count)
    (count-next-90 ?c1 - count ?c2 - count)
    (met-at-least-90)
  )

  (:functions
    (total-cost)
  )

  (:action advance-minute
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
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (at ?a russian_hill)
      (time ?t)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a russian_hill))
      (in-transit-out)
      (out-remaining r21_21)
      (not (in-meeting))
      (increase (total-cost) 1)
    )
  )

  (:action transit-tick-out
    :parameters (?t - minute ?t2 - minute ?r1 - r21 ?r2 - r21)
    :precondition (and
      (in-transit-out)
      (out-remaining ?r1)
      (dec-r21 ?r1 ?r2)
      (time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (out-remaining ?r1))
      (out-remaining ?r2)
      (increase (total-cost) 1)
    )
  )

  (:action arrive-ggp
    :parameters (?a - agent)
    :precondition (and
      (in-transit-out)
      (out-remaining r21_0)
    )
    :effect (and
      (at ?a golden_gate_park)
      (not (in-transit-out))
      (not (out-remaining r21_0))
    )
  )

  (:action depart-ggp-rh
    :parameters (?a - agent ?t - minute)
    :precondition (and
      (at ?a golden_gate_park)
      (time ?t)
      (not (in-transit-out))
      (not (in-transit-in))
    )
    :effect (and
      (not (at ?a golden_gate_park))
      (in-transit-in)
      (in-remaining r19_19)
      (not (in-meeting))
      (increase (total-cost) 1)
    )
  )

  (:action transit-tick-in
    :parameters (?t - minute ?t2 - minute ?r1 - r19 ?r2 - r19)
    :precondition (and
      (in-transit-in)
      (in-remaining ?r1)
      (dec-r19 ?r1 ?r2)
      (time ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (time ?t))
      (time ?t2)
      (not (in-remaining ?r1))
      (in-remaining ?r2)
      (increase (total-cost) 1)
    )
  )

  (:action arrive-rh
    :parameters (?a - agent)
    :precondition (and
      (in-transit-in)
      (in-remaining r19_0)
    )
    :effect (and
      (at ?a russian_hill)
      (not (in-transit-in))
      (not (in-remaining r19_0))
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
)