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
    (friends-met) ; Counter for meetings completed
    (total-cost) ; For minimization metric used for maximization
  )

  ; 1. Travel from Nob Hill to Marina District (11 minutes, T0 -> T11)
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
    )
  )

  ; 2. Wait until Mary starts (Duration 649 minutes: T11 -> T660)
  ; This action accounts for the 649 minutes elapsed between T11 (9:11 AM) and T660 (8:00 PM).
  (:action wait-until-mary-start
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T11)
    )
    :effect (and
      (not (time-state-is T11))
      (time-state-is T660)
    )
  )

  ; 3. Meet Mary for exactly 120 continuous minutes (T660 to T780)
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
    )
  )
  
  ; 4. Travel back Marina District to Nob Hill (12 minutes, T780 -> T792)
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
    )
  )
)