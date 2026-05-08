(define (problem schedule_meeting1_problem)
  (:domain jack_of_all_trades_domain)
  (:objects
    jacob gabriel matthew - person
    meeting1 - meeting
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )
  (:init
    ;; successor (consecutive half-hour) relations
    (next_slot slot_9_00 slot_9_30)
    (next_slot slot_9_30 slot_10_00)
    (next_slot slot_10_00 slot_10_30)
    (next_slot slot_10_30 slot_11_00)
    (next_slot slot_11_00 slot_11_30)
    (next_slot slot_11_30 slot_12_00)
    (next_slot slot_12_00 slot_12_30)
    (next_slot slot_12_30 slot_13_00)
    (next_slot slot_13_00 slot_13_30)
    (next_slot slot_13_30 slot_14_00)
    (next_slot slot_14_00 slot_14_30)
    (next_slot slot_14_30 slot_15_00)
    (next_slot slot_15_00 slot_15_30)
    (next_slot slot_15_30 slot_16_00)
    (next_slot slot_16_00 slot_16_30)

    ;; busy facts from existing calendars (half-hour slots)
    ;; Jacob: 10:00-11:00 -> slot_10_00, slot_10_30 ; 11:30-12:00 -> slot_11_30 ; 16:00-16:30 -> slot_16_00
    (busy jacob slot_10_00)
    (busy jacob slot_10_30)
    (busy jacob slot_11_30)
    (busy jacob slot_16_00)

    ;; Gabriel: 9:30-11:30 -> slot_9_30, slot_10_00, slot_10_30, slot_11_00 ; 13:00-13:30 -> slot_13_00 ; 15:00-15:30 -> slot_15_00
    (busy gabriel slot_9_30)
    (busy gabriel slot_10_00)
    (busy gabriel slot_10_30)
    (busy gabriel slot_11_00)
    (busy gabriel slot_13_00)
    (busy gabriel slot_15_00)

    ;; Matthew: 9:00-9:30 -> slot_9_00 ; 10:30-11:00 -> slot_10_30 ; 11:30-12:00 -> slot_11_30 ;
    ;; 12:30-14:00 -> slot_12_30, slot_13_00, slot_13_30 ; 15:30-16:30 -> slot_15_30, slot_16_00
    (busy matthew slot_9_00)
    (busy matthew slot_10_30)
    (busy matthew slot_11_30)
    (busy matthew slot_12_30)
    (busy matthew slot_13_00)
    (busy matthew slot_13_30)
    (busy matthew slot_15_30)
    (busy matthew slot_16_00)

    ;; specify the required participants for meeting1 (Jacob, Gabriel, Matthew)
    (requires_participant meeting1 jacob)
    (requires_participant meeting1 gabriel)
    (requires_participant meeting1 matthew)
  )
  (:goal (meeting_scheduled meeting1))
)