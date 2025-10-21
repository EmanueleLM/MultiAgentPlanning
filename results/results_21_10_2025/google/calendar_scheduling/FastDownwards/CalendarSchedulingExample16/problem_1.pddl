(define (problem schedule-monday)
  (:domain meeting-scheduler)

  ;; Objects: participants and 30-minute slots from 09:00 to 16:30 inclusive.
  (:objects
    scott gabriel christine - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Scott's availability (work hours 09:00-17:00 minus his busy intervals):
    ;; Busy: 09:30-10:30, 13:30-14:00, 14:30-15:00, 15:30-16:00, 16:30-17:00
    ;; Available 30-min start slots: 09:00, 10:30, 11:00, 11:30, 12:00, 12:30,
    ;;                              13:00, 14:00, 15:00, 16:00
    (available scott s09_00)
    (available scott s10_30)
    (available scott s11_00)
    (available scott s11_30)
    (available scott s12_00)
    (available scott s12_30)
    (available scott s13_00)
    (available scott s14_00)
    (available scott s15_00)
    (available scott s16_00)

    ;; Gabriel's availability: free all day (every 30-min slot from 09:00 to 16:30)
    (available gabriel s09_00) (available gabriel s09_30)
    (available gabriel s10_00) (available gabriel s10_30)
    (available gabriel s11_00) (available gabriel s11_30)
    (available gabriel s12_00) (available gabriel s12_30)
    (available gabriel s13_00) (available gabriel s13_30)
    (available gabriel s14_00) (available gabriel s14_30)
    (available gabriel s15_00) (available gabriel s15_30)
    (available gabriel s16_00) (available gabriel s16_30)

    ;; Christine's availability (work hours 09:00-17:00 minus busy intervals):
    ;; Busy: 09:00-10:00, 10:30-12:30, 13:00-17:00
    ;; Available 30-min start slots: 10:00, 12:30
    (available christine s10_00)
    (available christine s12_30)

    ;; No meeting scheduled yet
    (meeting_not_scheduled)
  )

  ;; Goal: the planner must schedule one meeting (the planner will choose a start slot
  ;; that satisfies all participants' availability). The only slot where all three
  ;; participants are available is s12_30 (12:30-13:00), so the plan will schedule that.
  (:goal (meeting_scheduled))
)