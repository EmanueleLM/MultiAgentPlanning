(define (problem schedule-monday)
  (:domain meeting-scheduler)

  ;; Objects: three participants and 30-minute slots from 09:00 to 16:30 inclusive
  (:objects
    scott gabriel christine - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; According to the provided availability entries (union of intervals),
    ;; these slots are available. The provided list includes 09:00-17:00,
    ;; so all defined slots are included for each participant.
    ;; Scott's availability:
    (available scott s09_00) (available scott s09_30) (available scott s10_00) (available scott s10_30)
    (available scott s11_00) (available scott s11_30) (available scott s12_00) (available scott s12_30)
    (available scott s13_00) (available scott s13_30) (available scott s14_00) (available scott s14_30)
    (available scott s15_00) (available scott s15_30) (available scott s16_00) (available scott s16_30)

    ;; Gabriel's availability:
    (available gabriel s09_00) (available gabriel s09_30) (available gabriel s10_00) (available gabriel s10_30)
    (available gabriel s11_00) (available gabriel s11_30) (available gabriel s12_00) (available gabriel s12_30)
    (available gabriel s13_00) (available gabriel s13_30) (available gabriel s14_00) (available gabriel s14_30)
    (available gabriel s15_00) (available gabriel s15_30) (available gabriel s16_00) (available gabriel s16_30)

    ;; Christine's availability:
    (available christine s09_00) (available christine s09_30) (available christine s10_00) (available christine s10_30)
    (available christine s11_00) (available christine s11_30) (available christine s12_00) (available christine s12_30)
    (available christine s13_00) (available christine s13_30) (available christine s14_00) (available christine s14_30)
    (available christine s15_00) (available christine s15_30) (available christine s16_00) (available christine s16_30)

    ;; No meeting scheduled yet:
    (meeting_not_scheduled)
  )

  ;; Goal: a single meeting has been scheduled (the planner will choose any start slot
  ;; that satisfies all participants' availability).
  (:goal (meeting_scheduled))
)