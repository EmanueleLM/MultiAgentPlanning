(define (domain MeetingPlanningExample18-domain)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types location)
  (:predicates
    (at ?l - location)
  )
  (:functions
    (current-time)           ; minutes since 00:00
    (betty-meeting)         ; accumulated continuous meeting minutes with Betty (we enforce a single 75-min action)
    (total-cost)            ; travel cost accumulated (minutes)
  )

  ; Travel: Marina -> Richmond (11 minutes)
  (:action travel_marina_to_richmond
    :parameters ()
    :precondition (and (at marina))
    :effect (and
      (not (at marina))
      (at richmond)
      (increase (current-time) 11)
      (increase (total-cost) 11)
    )
  )

  ; Travel: Richmond -> Marina (9 minutes)
  (:action travel_richmond_to_marina
    :parameters ()
    :precondition (and (at richmond))
    :effect (and
      (not (at richmond))
      (at marina)
      (increase (current-time) 9)
      (increase (total-cost) 9)
    )
  )

  ; Wait action specifically to reach the planned departure time 20:19 (1219 minutes).
  ; This enables the plan to advance time without incurring travel cost.
  (:action wait_to_1219
    :parameters ()
    :precondition (and (<= (current-time) 1219))
    :effect (and
      (assign (current-time) 1219)
    )
  )

  ; Meeting Betty: single continuous 75-minute meeting block entirely within Betty's availability window 20:30–22:00.
  ; Preconditions enforce location (Richmond) and that the meeting fully fits inside [1230,1320] minutes.
  (:action meet_betty_75
    :parameters ()
    :precondition (and
      (at richmond)
      (>= (current-time) 1230)                    ; meeting start no earlier than 20:30
      (<= (+ (current-time) 75) 1320)            ; meeting end no later than 22:00
    )
    :effect (and
      (increase (current-time) 75)
      (increase (betty-meeting) 75)
    )
  )
)