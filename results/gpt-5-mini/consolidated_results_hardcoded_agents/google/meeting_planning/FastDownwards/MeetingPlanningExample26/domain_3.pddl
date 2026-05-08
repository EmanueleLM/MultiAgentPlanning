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
    :parameters (?l - loc ?t - time ?t2 - time)
    :precondition (and (at ?l ?t) (next ?t ?t2))
    :effect (and
      (not (at ?l ?t))
      (at ?l ?t2)
    )
  )

  ;; Travel from Richmond District to Presidio: consumes exactly 7 minutes
  (:action move_richmond_to_presidio
    :parameters (?t - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time)
    :precondition (and
      (at richmond_district ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at richmond_district ?t))
      (at presidio ?t7)
    )
  )

  ;; Travel from Presidio to Richmond District: consumes exactly 7 minutes
  (:action move_presidio_to_richmond
    :parameters (?t - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time)
    :precondition (and
      (at presidio ?t)
      (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3)
      (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7)
    )
    :effect (and
      (not (at presidio ?t))
      (at richmond_district ?t7)
    )
  )

  ;; Meet Sarah for one minute: advance time by 1 minute, only at Presidio and only when Sarah is available at that start minute.
  (:action meet_sarah_one_minute
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at presidio ?t)
      (next ?t ?t2)
      (avail ?t)
    )
    :effect (and
      (not (at presidio ?t))
      (at presidio ?t2)
      (meeting ?t)
    )
  )
)