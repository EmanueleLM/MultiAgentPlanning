(define (problem schedule-single-30min-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    Diane Helen Arthur Ethan Beverly Deborah - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - timeslot
  )
  (:init
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Diane: free entire Monday but prefers to avoid meetings after 15:30 (so no starts at 15:30 or later)
    (available Diane s09_00) (available Diane s09_30) (available Diane s10_00) (available Diane s10_30)
    (available Diane s11_00) (available Diane s11_30) (available Diane s12_00) (available Diane s12_30)
    (available Diane s13_00) (available Diane s13_30) (available Diane s14_00) (available Diane s14_30)
    (available Diane s15_00)

    ;; Helen: no meetings on Monday (all slots available)
    (available Helen s09_00) (available Helen s09_30) (available Helen s10_00) (available Helen s10_30)
    (available Helen s11_00) (available Helen s11_30) (available Helen s12_00) (available Helen s12_30)
    (available Helen s13_00) (available Helen s13_30) (available Helen s14_00) (available Helen s14_30)
    (available Helen s15_00) (available Helen s15_30) (available Helen s16_00) (available Helen s16_30)

    ;; Arthur: no meetings on Monday (all slots available)
    (available Arthur s09_00) (available Arthur s09_30) (available Arthur s10_00) (available Arthur s10_30)
    (available Arthur s11_00) (available Arthur s11_30) (available Arthur s12_00) (available Arthur s12_30)
    (available Arthur s13_00) (available Arthur s13_30) (available Arthur s14_00) (available Arthur s14_30)
    (available Arthur s15_00) (available Arthur s15_30) (available Arthur s16_00) (available Arthur s16_30)

    ;; Ethan: busy 09:00-09:30, 10:00-10:30, 11:00-12:30, 13:30-15:00
    (available Ethan s09_30) (available Ethan s10_30) (available Ethan s12_30) (available Ethan s13_00)
    (available Ethan s15_00) (available Ethan s15_30) (available Ethan s16_00) (available Ethan s16_30)

    ;; Beverly: busy 09:00-10:00, 10:30-11:00, 11:30-12:30, 13:30-15:30, 16:30-17:00
    (available Beverly s10_00) (available Beverly s11_00) (available Beverly s12_30) (available Beverly s13_00)
    (available Beverly s15_30) (available Beverly s16_00)

    ;; Deborah: busy 09:00-11:00, 12:30-13:00, 13:30-14:30, 15:00-15:30, 16:00-17:00
    (available Deborah s11_00) (available Deborah s11_30) (available Deborah s12_00)
    (available Deborah s13_00) (available Deborah s14_30) (available Deborah s15_30)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)