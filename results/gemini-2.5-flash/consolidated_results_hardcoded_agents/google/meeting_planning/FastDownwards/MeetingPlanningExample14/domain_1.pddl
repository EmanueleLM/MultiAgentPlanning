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
    T0 T11 T660 T780 - time-state ; T0=0, T11=11, T660=660, T780=780
  )

  ; 1. Travel from Nob Hill to Marina District (11 minutes)
  ; Assumes immediate travel at T=0
  (define (action travel-nh-md)
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
  (define (action wait-until-mary-start)
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

  ; 3. Meet Mary for exactly 120 continuous minutes (T660 to T780)
  (define (action meet-mary-full-duration)
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
  ; This action is optional for the goal but included to model all given travel connections.
  (define (action travel-md-nh)
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