(define (domain meeting-scheduler-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    friend
  )

  (:predicates
    (at ?l - location)
    (ready-to-travel) ; Time 1027 (4:07 PM) achieved after waiting 487 minutes
    (arrived-russian-hill) ; Time 1050 (5:30 PM) achieved after 23 minutes travel
    (john-meeting-satisfied) ; Minimum 75 minutes meeting completed (ends 1125)
  )

  (:constants
    bayview - location
    russian-hill - location
    john - friend
  )

  ; 1. Wait: Represents the 487 minutes (540 to 1027) needed to align travel arrival (23 min) with John's 1050 start time.
  (:action wait-for-optimal-departure
    :parameters ()
    :precondition (and 
      (at bayview)
      (not (ready-to-travel))
    )
    :effect (and
      (ready-to-travel)
    )
  )

  ; 2. Travel: Represents the fixed 23 minutes travel, resulting in arrival at 1050.
  (:action travel-to-russianhill
    :parameters ()
    :precondition (and 
      (at bayview)
      (ready-to-travel)
    )
    :effect (and
      (not (at bayview))
      (at russian-hill)
      (arrived-russian-hill)
    )
  )

  ; 3. Meet John: Represents the mandatory minimum 75-minute meeting, starting at 1050 and ending at 1125, satisfying all constraints.
  (:action meet-john
    :parameters ()
    :precondition (and
      (at russian-hill)
      (arrived-russian-hill)
      (not (john-meeting-satisfied))
    )
    :effect (and
      (john-meeting-satisfied)
    )
  )
)