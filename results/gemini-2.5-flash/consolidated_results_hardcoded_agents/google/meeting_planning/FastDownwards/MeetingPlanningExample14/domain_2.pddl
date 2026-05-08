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
  )

  (:constants
    nob-hill marina-district - location
    T0 T11 T660 T780 - time-state
  )

  ; 1. Travel from Nob Hill to Marina District (11 minutes)
  ; T0 (9:00 AM) -> T11 (9:11 AM)
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

  ; 2. Wait until Mary starts (Duration 649 minutes: 660 - 11)
  ; T11 (9:11 AM) -> T660 (8:00 PM)
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

  ; 3. Meet Mary for exactly 120 continuous minutes (8:00 PM to 10:00 PM)
  ; T660 -> T780 (10:00 PM)
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
      (not (time-state-is T660))
      (time-state-is T780)
      (increase (total-time) 120)
    )
  )
  
  ; 4. Travel back Marina District to Nob Hill (12 minutes)
  ; T780 -> T792 (10:12 PM)
  (:action travel-md-nh
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T780)
    )
    :effect (and
      (not (at marina-district))
      (at nob-hill)
      (increase (total-time) 12)
    )
  )
)