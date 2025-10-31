(define (domain visitor-ronald-meet)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met-ronald)
  )

  ;; Visitor travel from Chinatown to Russian Hill (7 minutes)
  (:durative-action visitor-travel-c2r
    :parameters ()
    :duration (= ?duration 7)
    :condition (at start (at visitor Chinatown))
    :effect (and
              (at start (not (at visitor Chinatown)))
              (at end   (at visitor RussianHill))
            )
  )

  ;; Visitor travel from Russian Hill to Chinatown (9 minutes)
  (:durative-action visitor-travel-r2c
    :parameters ()
    :duration (= ?duration 9)
    :condition (at start (at visitor RussianHill))
    :effect (and
              (at start (not (at visitor RussianHill)))
              (at end   (at visitor Chinatown))
            )
  )

  ;; Meeting action: both visitor and Ronald are at Russian Hill for the whole meeting.
  ;; Duration fixed to 105 minutes to satisfy "at least 105 minutes" requirement.
  (:durative-action visitor-meet-ronald
    :parameters ()
    :duration (= ?duration 105)
    :condition (and
                (at start (at visitor RussianHill))
                (at start (at ronald RussianHill))
                (over all (at visitor RussianHill))
                (over all (at ronald RussianHill))
              )
    :effect (at end (met-ronald))
  )
)