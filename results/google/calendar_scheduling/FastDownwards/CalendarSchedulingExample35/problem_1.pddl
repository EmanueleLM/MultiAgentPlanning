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

    (is-s09_00 s09_00) (is-s09_30 s09_30) (is-s10_00 s10_00) (is-s10_30 s10_30)
    (is-s11_00 s11_00) (is-s11_30 s11_30) (is-s12_00 s12_00) (is-s12_30 s12_30)
    (is-s13_00 s13_00) (is-s13_30 s13_30) (is-s14_00 s14_00) (is-s14_30 s14_30)
    (is-s15_00 s15_00) (is-s15_30 s15_30) (is-s16_00 s16_00) (is-s16_30 s16_30)

    (= (total-cost) 0)

    (available Diane s09_00)
    (available Helen s09_00)
    (available Arthur s09_00)
    (available Ethan s09_00)
    (available Beverly s09_00)
    (available Deborah s09_00)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)