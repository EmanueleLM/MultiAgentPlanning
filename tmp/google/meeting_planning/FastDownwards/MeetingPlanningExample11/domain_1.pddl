(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types location timepoint)

  (:predicates
    (at-vis ?l - location)
    (at-other ?l - location)
    (now ?t - timepoint)
    (succ-minute ?t1 ?t2 - timepoint)    ; one-minute successor
    (succ-nh-sd ?t1 ?t2 - timepoint)     ; Nob Hill -> Sunset (t2 = t1 + 25)
    (succ-sd-nh ?t1 ?t2 - timepoint)     ; Sunset -> Nob Hill (t2 = t1 + 27)
    (succ-meet ?t1 ?t2 - timepoint)      ; meeting block of 75 minutes (t2 = t1 + 75) and within Carol window
    (met-carol)
  )

  ;; Visitor travel NH -> SD (uses precomputed succ-nh-sd facts)
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

  ;; Visitor travel SD -> NH
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

  ;; Other agent travel NH -> SD
  (:action other-travel-nobhill-to-sunset
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (at-other nob-hill) (succ-nh-sd ?t ?t2))
    :effect (and
      (not (at-other nob-hill))
      (at-other sunset-district)
      (not (now ?t))
      (now ?t2)
    )
    :cost 25
  )

  ;; Other agent travel SD -> NH
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

  ;; Visitor: advance time by one minute
  (:action visitor-wait-1
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (succ-minute ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
    :cost 1
  )

  ;; Other agent: advance time by one minute
  (:action other-wait-1
    :parameters (?t ?t2 - timepoint)
    :precondition (and (now ?t) (succ-minute ?t ?t2))
    :effect (and
      (not (now ?t))
      (now ?t2)
    )
    :cost 1
  )

  ;; Joint meeting: both at Sunset District, meeting lasts 75 minutes (precomputed succ-meet)
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