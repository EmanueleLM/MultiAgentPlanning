(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time-state
  )
  (:constants
    nob-hill marina-district - location
  )
  (:predicates
    (at ?l - location)
    (time-state-is ?ts - time-state)
    (mary-met)
  )

  ; 1. Travel from Nob Hill to Marina District (11 minutes, T0 (9:00 AM) -> T11 (9:11 AM))
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

  ; 2. Wait until Mary starts (T11 (9:11 AM) -> T660 (8:00 PM))
  ; Duration consumed: 649 minutes
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

  ; 3. Meet Mary for exactly 120 continuous minutes (T660 (8:00 PM) to T780 (10:00 PM))
  (:action meet-mary-full-duration
    :parameters ()
    :precondition (and
      (at marina-district)
      (time-state-is T660)
      (not (mary-met))
    )
    :effect (and
      (mary-met)
      (not (time-state-is T660))
      (time-state-is T780)
    )
  )
)