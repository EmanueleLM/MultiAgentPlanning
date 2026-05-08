(define (domain meeting-planning-example26)
  (:requirements :strips :typing :negative-preconditions)
  (:types time loc)
  (:predicates
    (next ?t1 - time ?t2 - time)
    (at ?l - loc ?t - time)
    (avail ?t - time)
    (meeting ?t - time)
  )

  ;; Wait one minute while staying at the same location
  (:action wait
    :parameters (?l - loc ?t0 - time ?t1 - time)
    :precondition (and (at ?l ?t0) (next ?t0 ?t1))
    :effect (and
      (not (at ?l ?t0))
      (at ?l ?t1)
    )
  )

  ;; Travel from Richmond District to Presidio: consumes exactly 7 minutes
  (:action move_richmond_to_presidio
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time)
    :precondition (and
      (at richmond_district ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at richmond_district ?t0))
      (at presidio ?t7)
    )
  )

  ;; Travel from Presidio to Richmond District: consumes exactly 7 minutes
  (:action move_presidio_to_richmond
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time)
    :precondition (and
      (at presidio ?t0)
      (next ?t0 ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at presidio ?t0))
      (at richmond_district ?t7)
    )
  )

  ;; Meet Sarah for one minute: advance time by 1 minute, only at Presidio and only when Sarah is available at that start minute.
  (:action meet_sarah_one_minute
    :parameters (?t0 - time ?t1 - time)
    :precondition (and
      (at presidio ?t0)
      (next ?t0 ?t1)
      (avail ?t0)
    )
    :effect (and
      (not (at presidio ?t0))
      (at presidio ?t1)
      (meeting ?t0)
    )
  )
)