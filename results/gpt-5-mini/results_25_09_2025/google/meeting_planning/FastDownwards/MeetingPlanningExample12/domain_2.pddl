(define (domain meet-scheduling)
  (:requirements :typing :adl :negative-preconditions :equality :fluents)
  (:types agent location)

  (:predicates
    (at-visitor ?l - location)
    (at-barbara ?l - location)
    (barbara-ready)
    (meeting-done)
    (time-t540)
    (time-t1064)
    (time-t1080)
    (time-t1200)
    (time-t1290)
  )

  (:functions (total-cost))

  (:action visitor_wait_until_1064
    :parameters ()
    :precondition (and
      (at-visitor north-beach)
      (time-t540)
    )
    :effect (and
      (not (time-t540))
      (time-t1064)
    )
  )

  (:action visitor_travel_nb_to_as
    :parameters ()
    :precondition (and
      (at-visitor north-beach)
      (time-t1064)
    )
    :effect (and
      (not (at-visitor north-beach))
      (at-visitor alamo-square)
      (not (time-t1064))
      (time-t1080)
      (increase (total-cost) 16)
    )
  )

  (:action advance_time_1080_to_1200
    :parameters ()
    :precondition (time-t1080)
    :effect (and
      (not (time-t1080))
      (time-t1200)
    )
  )

  (:action visitor_start_meeting_at_1080
    :parameters ()
    :precondition (and
      (at-visitor alamo-square)
      (at-barbara alamo-square)
      (barbara-ready)
      (time-t1080)
    )
    :effect (and
      (not (barbara-ready))
      (meeting-done)
      (not (time-t1080))
      (time-t1290)
    )
  )

  (:action visitor_start_meeting_at_1200
    :parameters ()
    :precondition (and
      (at-visitor alamo-square)
      (at-barbara alamo-square)
      (barbara-ready)
      (time-t1200)
    )
    :effect (and
      (not (barbara-ready))
      (meeting-done)
      (not (time-t1200))
      (time-t1290)
    )
  )

  (:action barbara_arrive_alamo_square
    :parameters ()
    :precondition (and
      (not (at-barbara alamo-square))
      (or (time-t540) (time-t1064))
    )
    :effect (and
      (at-barbara alamo-square)
      (not (time-t540))
      (not (time-t1064))
      (time-t1080)
    )
  )

  (:action barbara_prepare_meeting
    :parameters ()
    :precondition (and
      (at-barbara alamo-square)
      (or (time-t1080) (time-t1200))
      (not (barbara-ready))
    )
    :effect (barbara-ready)
  )

  (:metric minimize (total-cost))
)