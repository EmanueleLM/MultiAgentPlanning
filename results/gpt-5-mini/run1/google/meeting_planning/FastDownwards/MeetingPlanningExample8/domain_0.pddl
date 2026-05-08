(define (domain scheduling-temporal-discrete)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location timeslot meeting)

  (:predicates
    (at ?p - person ?l - location ?t - timeslot)            ; person p is at location l at the beginning of slot t
    (busy ?p - person ?t - timeslot)                        ; person p is occupied during slot t
    (available-start ?p - person ?t - timeslot)             ; person p allows meeting to start at slot t
    (meeting-scheduled ?m - meeting)                        ; meeting m has been scheduled
    (meeting-location ?m - meeting ?l - location)           ; meeting m takes place at location l
  )

  ;; Grounded travel actions (explicitly enumerated for the planable starts).
  ;; travel-home-cafe-start-t0: home -> cafe, duration 2 slots (occupies slots t0 and t1), arrives at t2
  (:action travel-home-cafe-start-t0
    :precondition (and
      (at traveler home t0)
      (not (busy traveler t0))
      (not (busy traveler t1))
    )
    :effect (and
      (busy traveler t0)
      (busy traveler t1)
      (at traveler cafe t2)
    )
  )

  ;; travel-cafe-office-start-t4: cafe -> office, duration 1 slot (occupies slot t4), arrives at t5
  (:action travel-cafe-office-start-t4
    :precondition (and
      (at traveler cafe t4)
      (not (busy traveler t4))
    )
    :effect (and
      (busy traveler t4)
      (at traveler office t5)
    )
  )

  ;; Meeting scheduling actions. Each action schedules a specific meeting at a specific start slot.
  ;; Meeting durations:
  ;; - meet-stephanie: 7 slots (105 minutes if slots are 15 minutes each)
  ;; - meet-alice: 2 slots
  ;; - meet-bob: 3 slots
  ;;
  ;; Each meeting action requires participants to be at the meeting location at the meeting start,
  ;; requires that none are busy during any slot of the meeting, and marks them busy for all those slots.
  ;; It also asserts meeting-scheduled for the meeting and asserts presence at the meeting location for each slot
  ;; of the meeting so leaving mid-meeting is prevented by busy checks on those slots.

  ;; schedule meet-alice at cafe starting t2 (duration 2 slots: t2,t3)
  (:action schedule-meet-alice-start-t2
    :precondition (and
      (at traveler cafe t2)
      (at alice cafe t2)
      (not (busy traveler t2))
      (not (busy traveler t3))
      (not (busy alice t2))
      (not (busy alice t3))
      (available-start alice t2)
    )
    :effect (and
      (busy traveler t2) (busy traveler t3)
      (busy alice t2) (busy alice t3)
      (at traveler cafe t2) (at traveler cafe t3)
      (at alice cafe t2) (at alice cafe t3)
      (meeting-scheduled meet-alice)
    )
  )

  ;; schedule meet-bob at office starting t5 (duration 3 slots: t5,t6,t7)
  (:action schedule-meet-bob-start-t5
    :precondition (and
      (at traveler office t5)
      (at bob office t5)
      (not (busy traveler t5))
      (not (busy traveler t6))
      (not (busy traveler t7))
      (not (busy bob t5))
      (not (busy bob t6))
      (not (busy bob t7))
      (available-start bob t5)
    )
    :effect (and
      (busy traveler t5) (busy traveler t6) (busy traveler t7)
      (busy bob t5) (busy bob t6) (busy bob t7)
      (at traveler office t5) (at traveler office t6) (at traveler office t7)
      (at bob office t5) (at bob office t6) (at bob office t7)
      (meeting-scheduled meet-bob)
    )
  )

  ;; schedule meet-stephanie at office starting t8 (duration 7 slots: t8..t14 inclusive = 7 slots)
  ;; This enforces Stephanie's minimum meeting length of 105 minutes (7 * 15-minute slots).
  (:action schedule-meet-stephanie-start-t8
    :precondition (and
      (at traveler office t8)
      (at stephanie office t8)
      (not (busy traveler t8)) (not (busy traveler t9)) (not (busy traveler t10)) (not (busy traveler t11)) (not (busy traveler t12)) (not (busy traveler t13)) (not (busy traveler t14))
      (not (busy stephanie t8)) (not (busy stephanie t9)) (not (busy stephanie t10)) (not (busy stephanie t11)) (not (busy stephanie t12)) (not (busy stephanie t13)) (not (busy stephanie t14))
      (available-start stephanie t8)
    )
    :effect (and
      ;; mark both busy for entire meeting span
      (busy traveler t8) (busy traveler t9) (busy traveler t10) (busy traveler t11) (busy traveler t12) (busy traveler t13) (busy traveler t14)
      (busy stephanie t8) (busy stephanie t9) (busy stephanie t10) (busy stephanie t11) (busy stephanie t12) (busy stephanie t13) (busy stephanie t14)
      ;; assert presence across the slots so they cannot be moved away mid-meeting
      (at traveler office t8) (at traveler office t9) (at traveler office t10) (at traveler office t11) (at traveler office t12) (at traveler office t13) (at traveler office t14)
      (at stephanie office t8) (at stephanie office t9) (at stephanie office t10) (at stephanie office t11) (at stephanie office t12) (at stephanie office t13) (at stephanie office t14)
      (meeting-scheduled meet-stephanie)
    )
  )
)