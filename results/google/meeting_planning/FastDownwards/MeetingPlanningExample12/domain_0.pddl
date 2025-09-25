(define (domain meet-scheduling)
  (:requirements :typing :fluents :negative-preconditions)
  (:types agent location)

  (:predicates
    (at-visitor ?l - location)
    (at-barbara ?l - location)
    (barbara-ready)
    (meeting-done)
  )

  (:functions
    (time)                    ; current time in minutes since midnight
  )

  ;; Visitor actions (kept distinct / namespaced)
  (:action visitor_wait_until_1064
    :parameters ()
    :precondition (and
      (at-visitor north-beach)
      (<= (time) 1064)        ; can wait until departure latest time = 17:44 (1064 minutes)
    )
    :effect (and
      (assign (time) 1064)
    )
  )

  (:action visitor_travel_nb_to_as
    :parameters ()
    :precondition (and
      (at-visitor north-beach)
      (= (time) 1064)         ; depart exactly at planned departure to reach AS at 18:00
    )
    :effect (and
      (not (at-visitor north-beach))
      (at-visitor alamo-square)
      (increase (time) 16)    ; travel time: 16 minutes N->AS (arrives 1080 = 18:00)
    )
  )

  (:action visitor_start_meeting_with_barbara
    :parameters ()
    :precondition (and
      (at-visitor alamo-square)
      (at-barbara alamo-square)
      (barbara-ready)
      (>= (time) 1080)        ; meeting cannot start before Barbara is available (18:00)
      (<= (time) 1200)        ; to allow 90-minute meeting before 21:30, start must be <= 20:00 (1200)
    )
    :effect (and
      (increase (time) 90)    ; meeting lasts at least 90 minutes
      (meeting-done)
      (not (barbara-ready))
    )
  )

  ;; Barbara actions (kept distinct / namespaced)
  ;; Barbara arrives at Alamo Square at 18:00 (1080). We provide an explicit action so we
  ;; don't assume she is present earlier than her stated availability window.
  (:action barbara_arrive_alamo_square
    :parameters ()
    :precondition (and
      (not (at-barbara alamo-square))
      (<= (time) 1080)        ; can arrive up to 18:00; action sets time to 18:00
    )
    :effect (and
      (at-barbara alamo-square)
      (assign (time) 1080)
    )
  )

  (:action barbara_prepare_meeting
    :parameters ()
    :precondition (and
      (at-barbara alamo-square)
      (>= (time) 1080)        ; Barbara only prepares once she is available
      (<= (time) 1200)        ; preparation must occur no later than 20:00 so meeting of 90m fits before 21:30
      (not (barbara-ready))
    )
    :effect (barbara-ready)
  )

)