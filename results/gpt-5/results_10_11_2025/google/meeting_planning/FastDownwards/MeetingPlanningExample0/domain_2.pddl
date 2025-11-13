(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:constants marina mission - location)
  (:predicates
    (at ?l - location)
    (time-now ?t - time)
    (step19 ?from - time ?to - time)
    (step20 ?from - time ?to - time)
    (step70 ?from - time ?to - time)
    (step120 ?from - time ?to - time)
    (steph-available ?t - time)
    (met-steph)
  )

  (:action wait-70
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-now ?t1)
      (step70 ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
  )

  (:action travel-marinamission
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina)
      (time-now ?t1)
      (step20 ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (at marina))
      (at mission)
    )
  )

  (:action travel-missionmarina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at mission)
      (time-now ?t1)
      (step19 ?t1 ?t2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (at mission))
      (at marina)
    )
  )

  (:action meet-steph-120
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at mission)
      (time-now ?t1)
      (step120 ?t1 ?t2)
      (steph-available ?t1)
      (steph-available ?t2)
      (not (met-steph))
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (met-steph)
    )
  )
)