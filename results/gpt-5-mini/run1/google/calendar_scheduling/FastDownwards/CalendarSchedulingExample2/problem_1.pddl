(define (problem CalendarSchedulingExample2)
  (:domain calendar_scheduling_example2)
  (:objects
    ;; 30-minute slots from 09:00 to 16:30 (start times)
    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; declare persons (constants are declared in the domain)
    (person roy)
    (person kathryn)
    (person amy)

    ;; declare slots
    (slot slot_09_00) (slot slot_09_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    ;; Availabilities derived from private busy intervals (slot start times are HH:MM)
    ;; Roy busy: 09:00,10:00,11:00,12:30  -> unavailable at those start slots
    ;; Roy available:
    (available roy slot_09_30)
    (available roy slot_10_30)
    (available roy slot_11_30)
    (available roy slot_12_00)
    (available roy slot_13_00)
    (available roy slot_13_30)
    (available roy slot_14_00)
    (available roy slot_14_30)
    (available roy slot_15_00)
    (available roy slot_15_30)
    (available roy slot_16_00)
    (available roy slot_16_30)

    ;; Kathryn busy: 09:30,16:30 -> unavailable at those start slots
    ;; Kathryn available:
    (available kathryn slot_09_00)
    (available kathryn slot_10_00)
    (available kathryn slot_10_30)
    (available kathryn slot_11_00)
    (available kathryn slot_11_30)
    (available kathryn slot_12_00)
    (available kathryn slot_12_30)
    (available kathryn slot_13_00)
    (available kathryn slot_13_30)
    (available kathryn slot_14_00)
    (available kathryn slot_14_30)
    (available kathryn slot_15_00)
    (available kathryn slot_15_30)
    (available kathryn slot_16_00)

    ;; Amy busy: 09:00-14:30, 15:00-16:00, 16:30-17:00
    ;; => Amy available at 14:30 and 16:00 only
    (available amy slot_14_30)
    (available amy slot_16_00)

    ;; Amy's preference: would rather not meet after 15:30.
    ;; Mark slots that conflict with that preference (informational only; not enforced).
    ;; According to the preference, slot_16_00 is discouraged.
    (discouraged slot_16_00)
  )

  ;; Goal: schedule exactly one meeting (the action enforces participant availability)
  (:goal (meeting_scheduled))
)