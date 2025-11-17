(define (domain sf_meetings)
  (:requirements :strips :typing)
  (:types
    location person time
  )
  (:predicates
    (at ?l - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (reach11 ?t1 - time ?t2 - time)
    (reach315 ?t1 - time ?t2 - time)
    (reach330 ?t1 - time ?t2 - time)
    (in-window ?t - time)
    (availability-start ?t - time)
    (availability-end ?t - time)
    (start ?t - time)
    (meeting-open)
    (met-kenneth)
    (day-complete)
    (travel-clean)
  )

  (:action advance-to-availability
    :parameters (?l - location ?t0 - time ?tA - time)
    :precondition (and
      (start ?t0)
      (at ?l ?t0)
      (availability-start ?tA)
      (reach315 ?t0 ?tA)
    )
    :effect (and
      (at ?l ?tA)
    )
  )

  (:action travel-fw-nh
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (in-window ?t1)
      (in-window ?t2)
      (at fw ?t1)
      (reach11 ?t1 ?t2)
      (travel-clean)
    )
    :effect (and
      (at nh ?t2)
      (not (travel-clean))
    )
  )

  (:action travel-nh-fw
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (in-window ?t1)
      (in-window ?t2)
      (at nh ?t1)
      (reach11 ?t1 ?t2)
      (travel-clean)
    )
    :effect (and
      (at fw ?t2)
      (not (travel-clean))
    )
  )

  (:action meet-kenneth-full-window
    :parameters (?l - location ?ts - time ?te - time)
    :precondition (and
      (meeting-open)
      (availability-start ?ts)
      (availability-end ?te)
      (in-window ?ts)
      (in-window ?te)
      (reach330 ?ts ?te)
      (at ?l ?ts)
    )
    :effect (and
      (met-kenneth)
      (day-complete)
      (at ?l ?te)
      (not (meeting-open))
    )
  )
)