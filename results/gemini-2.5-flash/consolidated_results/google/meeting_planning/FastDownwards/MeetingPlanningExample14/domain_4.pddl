(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location time-state
  )
  (:predicates
    (at ?l - location)
    (time-state-is ?ts - time-state)
    (mary-met)
  )
  (:functions
    (total-time) ; Tracks elapsed time in minutes
    (friends-met) ; Counter for meetings completed
    (total-cost) ; For minimization metric used for maximization
  )

  ; 1. Travel from Nob Hill to Marina District (11 minutes)
  (:action travel-nh-md
    :parameters ()
    :precondition (and
      (at nob-hill)
      (time-state-is T0)
    )
    :effect (and
      (not (at nob-hill))
      (at marina-district)
      (not (time-state-is T0))
      (time-state-is T11)
      (increase (total-time) 11)
    )
  )

  ; 2. Wait until Mary starts (Duration 649 minutes: T660 - T11)
  (:action wait-until-mary-start
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T11)
    )
    :effect (and
      (not (time-state-is T11))
      (time-state-is T660)
      (increase (total-time) 649)
    )
  )

  ; 3. Meet Mary for exactly 120 continuous minutes (8:00 PM T660 to 10:00 PM T780)
  (:action meet-mary-full-duration
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T660)
      (not (mary-met))
    )
    :effect (and
      (mary-met)
      (increase (friends-met) 1)
      (increase (total-cost) -1) ; Maximize meetings
      (not (time-state-is T660))
      (time-state-is T780)
      (increase (total-time) 120)
    )
  )
  
  ; 4. Travel back Marina District to Nob Hill (12 minutes)
  (:action travel-md-nh
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T780)
    )
    :effect (and
      (not (at marina-district))
      (at nob-hill)
      (not (time-state-is T780))
      (time-state-is T792)
      (increase (total-time) 12)
    )
  )
)