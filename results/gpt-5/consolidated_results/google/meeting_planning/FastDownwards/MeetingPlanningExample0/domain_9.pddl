(define (domain meeting-planning-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time level)
  (:constants
    marina mission - location
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
    (required-level ?k - level)
    (pre-meeting)
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
      (pre-meeting)
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
      (met-steph)
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
      (pre-meeting)
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

  (:action end-meeting
    :parameters (?k - level)
    :precondition (and
      (meeting-active)
      (progress ?k)
      (required-level ?k)
    )
    :effect (and
      (not (meeting-active))
      (met-steph)
      (not (pre-meeting))
    )
  )
)