(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time level)
  (:constants
    marina mission - location
    l119 l120 - level
  )
  (:predicates
    (at ?l - location)
    (time-now ?t - time)
    (succ ?t1 - time ?t2 - time)
    (span19 ?t1 - time ?t2 - time)
    (span20 ?t1 - time ?t2 - time)
    (steph-available ?t - time)
    (meeting-active)
    (progress ?k - level)
    (next-level ?k1 - level ?k2 - level)
    (start-level ?k - level)
    (allow-end)
    (met-steph)
  )

  (:action wait-1
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-now ?t1)
      (succ ?t1 ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
    )
  )

  (:action travel-marinamission-20
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at marina)
      (time-now ?t1)
      (span20 ?t1 ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (at marina))
      (at mission)
    )
  )

  (:action travel-missionmarina-19
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at mission)
      (time-now ?t1)
      (span19 ?t1 ?t2)
      (not (meeting-active))
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (at mission))
      (at marina)
    )
  )

  (:action start-meeting
    :parameters (?t - time ?k - level)
    :precondition (and
      (not (meeting-active))
      (at mission)
      (time-now ?t)
      (steph-available ?t)
      (progress ?k)
      (start-level ?k)
    )
    :effect (meeting-active)
  )

  (:action meet-tick
    :parameters (?t1 - time ?t2 - time ?k1 - level ?k2 - level)
    :precondition (and
      (meeting-active)
      (at mission)
      (time-now ?t1)
      (succ ?t1 ?t2)
      (steph-available ?t1)
      (progress ?k1)
      (next-level ?k1 ?k2)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (progress ?k1))
      (progress ?k2)
    )
  )

  (:action meet-tick-120
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting-active)
      (at mission)
      (time-now ?t1)
      (succ ?t1 ?t2)
      (steph-available ?t1)
      (progress l119)
    )
    :effect (and
      (not (time-now ?t1))
      (time-now ?t2)
      (not (progress l119))
      (progress l120)
      (allow-end)
    )
  )

  (:action end-meeting
    :parameters ()
    :precondition (and
      (meeting-active)
      (allow-end)
    )
    :effect (and
      (not (meeting-active))
      (met-steph)
    )
  )
)