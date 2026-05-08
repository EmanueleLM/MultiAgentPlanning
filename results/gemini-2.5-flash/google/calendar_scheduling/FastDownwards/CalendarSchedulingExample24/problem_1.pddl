(define (problem calendar_scheduling_24_problem)
  (:domain calendar_scheduling_24)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30 s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - time_slot
  )
  (:init
    ; Benjamin's availability (ends by 9:30 means only 9:00-9:30 slot)
    (benjamin_available s09_00)

    ; Hannah's availability (all slots from 9:00 to 17:00 for 30 min duration)
    (hannah_available s09_00)
    (hannah_available s09_30)
    (hannah_available s10_00)
    (hannah_available s10_30)
    (hannah_available s11_00)
    (hannah_available s11_30)
    (hannah_available s12_00)
    (hannah_available s12_30)
    (hannah_available s13_00)
    (hannah_available s13_30)
    (hannah_available s14_00)
    (hannah_available s14_30)
    (hannah_available s15_00)
    (hannah_available s15_30)
    (hannah_available s16_00)
    (hannah_available s16_30)

    ; Brenda's availability
    ; Busy: 9:30-10:00, 11:30-12:30, 14:00-16:30
    ; Free slots:
    ; 9:00-9:30 -> s09_00
    ; 10:00-10:30 -> s10_00
    ; 10:30-11:00 -> s10_30
    ; 11:00-11:30 -> s11_00
    ; 12:30-13:00 -> s12_30
    ; 13:00-13:30 -> s13_00
    ; 13:30-14:00 -> s13_30
    ; 16:30-17:00 -> s16_30
    (brenda_available s09_00)
    (brenda_available s10_00)
    (brenda_available s10_30)
    (brenda_available s11_00)
    (brenda_available s12_30)
    (brenda_available s13_00)
    (brenda_available s13_30)
    (brenda_available s16_30)
  )
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)