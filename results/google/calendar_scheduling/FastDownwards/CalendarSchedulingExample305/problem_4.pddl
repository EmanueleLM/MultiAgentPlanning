(define (problem schedule-single-30min-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    diane helen arthur ethan beverly deborah - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - timeslot
  )
  (:init
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Diane: free entire Monday but prefers to avoid meetings after 15:30 (so no starts at 15:30 or later)
    (available diane s09_00) (available diane s09_30) (available diane s10_00) (available diane s10_30)
    (available diane s11_00) (available diane s11_30) (available diane s12_00) (available diane s12_30)
    (available diane s13_00) (available diane s13_30) (available diane s14_00) (available diane s14_30)
    (available diane s15_00)

    ;; Helen: no meetings on Monday (all slots available)
    (available helen s09_00) (available helen s09_30) (available helen s10_00) (available helen s10_30)
    (available helen s11_00) (available helen s11_30) (available helen s12_00) (available helen s12_30)
    (available helen s13_00) (available helen s13_30) (available helen s14_00) (available helen s14_30)
    (available helen s15_00) (available helen s15_30) (available helen s16_00) (available helen s16_30)

    ;; Arthur: no meetings on Monday (all slots available)
    (available arthur s09_00) (available arthur s09_30) (available arthur s10_00) (available arthur s10_30)
    (available arthur s11_00) (available arthur s11_30) (available arthur s12_00) (available arthur s12_30)
    (available arthur s13_00) (available arthur s13_30) (available arthur s14_00) (available arthur s14_30)
    (available arthur s15_00) (available arthur s15_30) (available arthur s16_00) (available arthur s16_30)

    ;; Ethan: busy 09:00-09:30, 10:00-10:30, 11:00-12:30, 13:30-15:00
    (available ethan s09_30) (available ethan s10_30) (available ethan s12_30) (available ethan s13_00)
    (available ethan s15_00) (available ethan s15_30) (available ethan s16_00) (available ethan s16_30)

    ;; Beverly: busy 09:00-10:00, 10:30-11:00, 11:30-12:30, 13:30-15:30, 16:30-17:00
    (available beverly s10_00) (available beverly s11_00) (available beverly s12_30) (available beverly s13_00)
    (available beverly s15_30) (available beverly s16_00)

    ;; Deborah: busy 09:00-11:00, 12:30-13:00, 13:30-14:30, 15:00-15:30, 16:00-17:00
    (available deborah s11_00) (available deborah s11_30) (available deborah s12_00)
    (available deborah s13_00) (available deborah s14_30) (available deborah s15_30)

    (= (total-cost) 0)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)