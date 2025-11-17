(define (domain meetingplanningexample23-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location person)
  (:constants
    russian_hill - location
  )
  (:predicates
    (at ?l - location)
    (known-location ?l - location)
    (before-john-start)
    (at-john-start)
    (within-window-75-left)
    (at-latest-departure)
    (met-john)
    (need-5)
    (need-4)
    (need-3)
    (need-2)
    (need-1)
  )
  (:functions
    (total-cost)
  )

  (:action wait-until-latest-departure
    :parameters ()
    :precondition (and
      (at bayview)
      (before-john-start)
      (not (at-latest-departure))
    )
    :effect (and
      (at-latest-departure)
      (increase (total-cost) 487)
    )
  )

  (:action travel-bayview-russian_hill-at-latest
    :parameters ()
    :precondition (and
      (at bayview)
      (known-location russian_hill)
      (before-john-start)
      (at-latest-departure)
    )
    :effect (and
      (not (at bayview))
      (at russian_hill)
      (not (before-john-start))
      (at-john-start)
      (within-window-75-left)
      (not (at-latest-departure))
      (increase (total-cost) 23)
    )
  )

  (:action meet-15-from-5
    :parameters ()
    :precondition (and
      (at russian_hill)
      (at-john-start)
      (within-window-75-left)
      (need-5)
      (not (met-john))
    )
    :effect (and
      (not (need-5))
      (need-4)
      (increase (total-cost) 15)
    )
  )

  (:action meet-15-from-4
    :parameters ()
    :precondition (and
      (at russian_hill)
      (at-john-start)
      (within-window-75-left)
      (need-4)
      (not (met-john))
    )
    :effect (and
      (not (need-4))
      (need-3)
      (increase (total-cost) 15)
    )
  )

  (:action meet-15-from-3
    :parameters ()
    :precondition (and
      (at russian_hill)
      (at-john-start)
      (within-window-75-left)
      (need-3)
      (not (met-john))
    )
    :effect (and
      (not (need-3))
      (need-2)
      (increase (total-cost) 15)
    )
  )

  (:action meet-15-from-2
    :parameters ()
    :precondition (and
      (at russian_hill)
      (at-john-start)
      (within-window-75-left)
      (need-2)
      (not (met-john))
    )
    :effect (and
      (not (need-2))
      (need-1)
      (increase (total-cost) 15)
    )
  )

  (:action meet-15-final-from-1
    :parameters ()
    :precondition (and
      (at russian_hill)
      (at-john-start)
      (within-window-75-left)
      (need-1)
      (not (met-john))
    )
    :effect (and
      (not (need-1))
      (met-john)
      (increase (total-cost) 15)
    )
  )
)