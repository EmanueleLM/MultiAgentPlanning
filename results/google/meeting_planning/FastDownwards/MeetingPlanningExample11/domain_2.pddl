(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types location timepoint)

  (:predicates
    (at-vis ?l - location)
    (at-other ?l - location)
    (now ?t - timepoint)
    (succ-minute ?t1 ?t2 - timepoint)
    (succ-nh-sd ?t1 ?t2 - timepoint)
    (succ-sd-nh ?t1 ?t2 - timepoint)
    (succ-meet ?t1 ?t2 - timepoint)
    (met-carol)
  )

  (:action visitor-travel-nobhill-to-sunset
    :parameters (?t ?t2 - timepoint ?l1 - location ?l2 - location)
    :precondition (and (now ?t) (at-vis nob-hill) (succ-nh-sd ?t ?t2))
    :effect (and
      (not (at-vis nob-hill))
      (at-vis sunset-district)
      (not (now ?t))
      (now ?t2)
    )
    :cost 25
  )

  (:action visitor-travel-sunset-to-nobhill
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (at-vis sunset-district) (succ-sd-nh ?t ?t2))
    :effect (and
      (not (at-vis sunset-district))
      (at-vis nob-hill)
      (not (now ?t))
      (now ?t2)
    )
    :cost 27
  )

  (:action other-travel-nobhill-to-sunset
    :parameters (?t ?t2 - timepoint ?l1 - location ?l2 - location)
    :precondition (and (now ?t) (at-other nob-hill) (succ-nh-sd ?t ?t2))
    :effect (and
      (not (at-other nob-hill))
      (at-other sunset-district)
      (not (now ?t))
      (now ?t2)
    )
    :cost 25
  )

  (:action other-travel-sunset-to-nobhill
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (at-other sunset-district) (succ-sd-nh ?t ?t2))
    :effect (and
      (not (at-other sunset-district))
      (at-other nob-hill)
      (not (now ?t))
      (now ?t2)
    )
    :cost 27
  )

  (:action visitor-wait-1
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (succ-minute ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
    :cost 1
  )

  (:action other-wait-1
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (succ-minute ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
    :cost 1
  )

  (:action meet-carol
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (succ-meet ?t ?t2) (at-vis sunset-district) (at-other sunset-district))
    :effect (and
      (met-carol)
      (not (now ?t))
      (now ?t2)
    )
    :cost 75
  )
)