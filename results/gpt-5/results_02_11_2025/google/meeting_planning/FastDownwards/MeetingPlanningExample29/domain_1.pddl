(define (domain sf-meet-nancy)
  (:requirements :strips :typing)
  (:types time location)
  (:predicates
    (at ?l - location)
    (at-slot ?t - time)
    (next ?t1 - time ?t2 - time)
    (within-nancy-window ?t - time)
    (at-haight ?l - location)
    (progress-p0)
    (progress-p1)
    (progress-p2)
    (progress-p3)
    (progress-p4)
    (progress-p5)
  )

  (:action wait
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at-slot ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
    )
  )

  (:action travel-sunset-haight
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at sunset_district)
      (at-slot ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (at sunset_district))
      (at haight_ashbury)
    )
  )

  (:action travel-haight-sunset
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (at haight_ashbury))
      (at sunset_district)
    )
  )

  (:action meet-step-1
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (within-nancy-window ?t)
      (next ?t ?t2)
      (progress-p0)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (progress-p0))
      (progress-p1)
    )
  )

  (:action meet-step-2
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (within-nancy-window ?t)
      (next ?t ?t2)
      (progress-p1)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (progress-p1))
      (progress-p2)
    )
  )

  (:action meet-step-3
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (within-nancy-window ?t)
      (next ?t ?t2)
      (progress-p2)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (progress-p2))
      (progress-p3)
    )
  )

  (:action meet-step-4
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (within-nancy-window ?t)
      (next ?t ?t2)
      (progress-p3)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (progress-p3))
      (progress-p4)
    )
  )

  (:action meet-step-5
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at haight_ashbury)
      (at-slot ?t)
      (within-nancy-window ?t)
      (next ?t ?t2)
      (progress-p4)
    )
    :effect (and
      (not (at-slot ?t))
      (at-slot ?t2)
      (not (progress-p4))
      (progress-p5)
    )
  )
)