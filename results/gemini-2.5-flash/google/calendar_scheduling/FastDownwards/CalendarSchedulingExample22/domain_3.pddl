(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    person
    time_slot
  )
  (:predicates
    (busy ?p - person ?s - time_slot)
    (meeting_found)
  )
  (:functions (total-cost))

  ; Action for a 1-hour meeting starting at 9:00 (occupies slot_0 and slot_1)
  (:action schedule_meeting_at_9_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_0))
      (not (busy theresa slot_1))
      (not (busy charles slot_0))
      (not (busy charles slot_1))
      (not (busy betty slot_0))
      (not (busy betty slot_1))
    )
    :effect (and (meeting_found) (increase (total-cost) 0))
  )

  ; Action for a 1-hour meeting starting at 9:30 (occupies slot_1 and slot_2)
  (:action schedule_meeting_at_9_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_1))
      (not (busy theresa slot_2))
      (not (busy charles slot_1))
      (not (busy charles slot_2))
      (not (busy betty slot_1))
      (not (busy betty slot_2))
    )
    :effect (and (meeting_found) (increase (total-cost) 1))
  )

  ; Action for a 1-hour meeting starting at 10:00 (occupies slot_2 and slot_3)
  (:action schedule_meeting_at_10_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_2))
      (not (busy theresa slot_3))
      (not (busy charles slot_2))
      (not (busy charles slot_3))
      (not (busy betty slot_2))
      (not (busy betty slot_3))
    )
    :effect (and (meeting_found) (increase (total-cost) 2))
  )

  ; Action for a 1-hour meeting starting at 10:30 (occupies slot_3 and slot_4)
  (:action schedule_meeting_at_10_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_3))
      (not (busy theresa slot_4))
      (not (busy charles slot_3))
      (not (busy charles slot_4))
      (not (busy betty slot_3))
      (not (busy betty slot_4))
    )
    :effect (and (meeting_found) (increase (total-cost) 3))
  )

  ; Action for a 1-hour meeting starting at 11:00 (occupies slot_4 and slot_5)
  (:action schedule_meeting_at_11_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_4))
      (not (busy theresa slot_5))
      (not (busy charles slot_4))
      (not (busy charles slot_5))
      (not (busy betty slot_4))
      (not (busy betty slot_5))
    )
    :effect (and (meeting_found) (increase (total-cost) 4))
  )

  ; Action for a 1-hour meeting starting at 11:30 (occupies slot_5 and slot_6)
  (:action schedule_meeting_at_11_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_5))
      (not (busy theresa slot_6))
      (not (busy charles slot_5))
      (not (busy charles slot_6))
      (not (busy betty slot_5))
      (not (busy betty slot_6))
    )
    :effect (and (meeting_found) (increase (total-cost) 5))
  )

  ; Action for a 1-hour meeting starting at 12:00 (occupies slot_6 and slot_7)
  (:action schedule_meeting_at_12_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_6))
      (not (busy theresa slot_7))
      (not (busy charles slot_6))
      (not (busy charles slot_7))
      (not (busy betty slot_6))
      (not (busy betty slot_7))
    )
    :effect (and (meeting_found) (increase (total-cost) 6))
  )

  ; Action for a 1-hour meeting starting at 12:30 (occupies slot_7 and slot_8)
  (:action schedule_meeting_at_12_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_7))
      (not (busy theresa slot_8))
      (not (busy charles slot_7))
      (not (busy charles slot_8))
      (not (busy betty slot_7))
      (not (busy betty slot_8))
    )
    :effect (and (meeting_found) (increase (total-cost) 7))
  )

  ; Action for a 1-hour meeting starting at 13:00 (occupies slot_8 and slot_9)
  (:action schedule_meeting_at_13_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_8))
      (not (busy theresa slot_9))
      (not (busy charles slot_8))
      (not (busy charles slot_9))
      (not (busy betty slot_8))
      (not (busy betty slot_9))
    )
    :effect (and (meeting_found) (increase (total-cost) 8))
  )

  ; Action for a 1-hour meeting starting at 13:30 (occupies slot_9 and slot_10)
  (:action schedule_meeting_at_13_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_9))
      (not (busy theresa slot_10))
      (not (busy charles slot_9))
      (not (busy charles slot_10))
      (not (busy betty slot_9))
      (not (busy betty slot_10))
    )
    :effect (and (meeting_found) (increase (total-cost) 9))
  )

  ; Action for a 1-hour meeting starting at 14:00 (occupies slot_10 and slot_11)
  (:action schedule_meeting_at_14_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_10))
      (not (busy theresa slot_11))
      (not (busy charles slot_10))
      (not (busy charles slot_11))
      (not (busy betty slot_10))
      (not (busy betty slot_11))
    )
    :effect (and (meeting_found) (increase (total-cost) 10))
  )

  ; Action for a 1-hour meeting starting at 14:30 (occupies slot_11 and slot_12)
  (:action schedule_meeting_at_14_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_11))
      (not (busy theresa slot_12))
      (not (busy charles slot_11))
      (not (busy charles slot_12))
      (not (busy betty slot_11))
      (not (busy betty slot_12))
    )
    :effect (and (meeting_found) (increase (total-cost) 11))
  )

  ; Action for a 1-hour meeting starting at 15:00 (occupies slot_12 and slot_13)
  (:action schedule_meeting_at_15_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_12))
      (not (busy theresa slot_13))
      (not (busy charles slot_12))
      (not (busy charles slot_13))
      (not (busy betty slot_12))
      (not (busy betty slot_13))
    )
    :effect (and (meeting_found) (increase (total-cost) 12))
  )

  ; Action for a 1-hour meeting starting at 15:30 (occupies slot_13 and slot_14)
  (:action schedule_meeting_at_15_30
    :parameters ()
    :precondition (and
      (not (busy theresa slot_13))
      (not (busy theresa slot_14))
      (not (busy charles slot_13))
      (not (busy charles slot_14))
      (not (busy betty slot_13))
      (not (busy betty slot_14))
    )
    :effect (and (meeting_found) (increase (total-cost) 13))
  )

  ; Action for a 1-hour meeting starting at 16:00 (occupies slot_14 and slot_15)
  (:action schedule_meeting_at_16_00
    :parameters ()
    :precondition (and
      (not (busy theresa slot_14))
      (not (busy theresa slot_15))
      (not (busy charles slot_14))
      (not (busy charles slot_15))
      (not (busy betty slot_14))
      (not (busy betty slot_15))
    )
    :effect (and (meeting_found) (increase (total-cost) 14))
  )
)