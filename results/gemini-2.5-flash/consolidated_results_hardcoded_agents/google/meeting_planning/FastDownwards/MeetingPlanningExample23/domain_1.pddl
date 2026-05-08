(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    time-marker
    friend
  )

  (:constants
    bayview russian-hill - location
    john - friend
    ; Defined time markers for key events (in minutes)
    T540 - time-marker    ; 9:00 AM (Start)
    T1027 - time-marker   ; 1050 - 23 (Earliest travel start)
    T1050 - time-marker   ; 5:30 PM (John available / Arrival time)
    T1125 - time-marker   ; 1050 + 75 (Earliest meeting end)
    T1185 - time-marker   ; 1260 - 75 (Latest meeting start, unused in this specific path)
    T1260 - time-marker   ; 9:00 PM (John unavailable, boundary marker)
  )

  (:predicates
    (at ?l - location)
    (can-travel ?from ?to - location)
    (john-met)
    (time-is ?t - time-marker) 
    (meeting-75-required)
  )

  ; 1. Waiting Action: Spans from 9:00 AM (540) to 4:07 PM (1027). This action implicitly covers the duration (487 minutes) available for other activities before critical travel path starts.
  (:action wait-for-travel-window
    :parameters ()
    :precondition (and 
      (at bayview)
      (time-is T540)
    )
    :effect (and
      (not (time-is T540))
      (time-is T1027)
    )
  )

  ; 2. Travel Action: Models the mandatory 23-minute travel time, starting exactly at T1027 to arrive exactly at T1050 (John's availability start).
  (:action travel-bayview-to-russianhill
    :parameters ()
    :precondition (and 
      (at bayview)
      (time-is T1027) 
      (can-travel bayview russian-hill)
    )
    :effect (and
      (not (at bayview))
      (at russian-hill)
      (not (time-is T1027))
      (time-is T1050) ; Arrival time (5:30 PM)
    )
  )

  ; 3. Meet John Action: Models the minimum 75-minute meeting duration (1050 to 1125).
  (:action meet-john-75-minutes
    :parameters (?f - friend)
    :precondition (and
      (at russian-hill)
      (time-is T1050) ; Must start during availability (1050)
      (meeting-75-required)
    )
    :effect (and
      (john-met)
      (not (time-is T1050))
      (time-is T1125) ; Meeting ends at 6:45 PM, well before 9:00 PM deadline
    )
  )
)