(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (participant diane) (participant jack) (participant eugene) (participant patricia)

    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Diane: busy 09:30-10:00, 14:30-15:00 -> free others
    (free-slot diane s09_00) (free-slot diane s10_00) (free-slot diane s10_30)
    (free-slot diane s11_00) (free-slot diane s11_30) (free-slot diane s12_00)
    (free-slot diane s12_30) (free-slot diane s13_00) (free-slot diane s13_30)
    (free-slot diane s14_00) (free-slot diane s15_00) (free-slot diane s15_30)
    (free-slot diane s16_00) (free-slot diane s16_30)

    ;; Jack: busy 13:30-14:00, 14:30-15:00 -> free others
    (free-slot jack s09_00) (free-slot jack s09_30) (free-slot jack s10_00) (free-slot jack s10_30)
    (free-slot jack s11_00) (free-slot jack s11_30) (free-slot jack s12_00) (free-slot jack s12_30)
    (free-slot jack s13_00) (free-slot jack s14_00) (free-slot jack s15_00) (free-slot jack s15_30)
    (free-slot jack s16_00) (free-slot jack s16_30)

    ;; Eugene: busy 09:00-10:00, 10:30-11:30, 12:00-14:30, 15:00-16:30
    ;; free: 10:00, 11:30, 14:30, 16:30
    (free-slot eugene s10_00) (free-slot eugene s11_30) (free-slot eugene s14_30) (free-slot eugene s16_30)

    ;; Patricia: busy 09:30-10:30, 11:00-12:00, 12:30-14:00, 15:00-16:30
    ;; free: 09:00,10:30,11:30,12:00,14:00,14:30,16:30
    (free-slot patricia s09_00) (free-slot patricia s10_30) (free-slot patricia s11_30)
    (free-slot patricia s12_00) (free-slot patricia s14_00) (free-slot patricia s14_30)
    (free-slot patricia s16_30)
  )
  (:goal (and
    (meeting-scheduled)
    (meeting-with diane)
    (meeting-with jack)
    (meeting-with eugene)
    (meeting-with patricia)
  ))
)