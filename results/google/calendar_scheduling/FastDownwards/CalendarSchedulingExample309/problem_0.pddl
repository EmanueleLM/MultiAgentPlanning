(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; objects: slots represent 30-minute start times between 09:00 and 16:30
  (:objects
    nicholas emma catherine steven adam lori - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  ;; initial state: free facts derived from participants' busy intervals (busy -> not listed as free)
  ;; Nicholas: free all day 09:00-17:00
  (:init
    (free nicholas s09_00) (free nicholas s09_30) (free nicholas s10_00) (free nicholas s10_30)
    (free nicholas s11_00) (free nicholas s11_30) (free nicholas s12_00) (free nicholas s12_30)
    (free nicholas s13_00) (free nicholas s13_30) (free nicholas s14_00) (free nicholas s14_30)
    (free nicholas s15_00) (free nicholas s15_30) (free nicholas s16_00) (free nicholas s16_30)

    ;; Emma: free entire Monday 09:00-17:00
    (free emma s09_00) (free emma s09_30) (free emma s10_00) (free emma s10_30)
    (free emma s11_00) (free emma s11_30) (free emma s12_00) (free emma s12_30)
    (free emma s13_00) (free emma s13_30) (free emma s14_00) (free emma s14_30)
    (free emma s15_00) (free emma s15_30) (free emma s16_00) (free emma s16_30)

    ;; Catherine busy: 09:00, 11:30, 13:30, 15:30 -> those are not included as free
    (free catherine s09_30) (free catherine s10_00) (free catherine s10_30) (free catherine s11_00)
    (free catherine s12_00) (free catherine s12_30) (free catherine s13_00)
    (free catherine s14_00) (free catherine s14_30) (free catherine s15_00)
    (free catherine s16_00) (free catherine s16_30)

    ;; Steven busy: 09:00 and 10:00-16:30 (i.e., unavailable for slots starting 10:00 through 16:00)
    ;; so only free slots are 09:30 and 16:30
    (free steven s09_30) (free steven s16_30)

    ;; Adam busy: 09:00-10:00, 10:30-13:00, 13:30-14:00, 14:30-16:30
    ;; free slots computed: 10:00, 13:00, 14:00, 16:30
    (free adam s10_00) (free adam s13_00) (free adam s14_00) (free adam s16_30)

    ;; Lori busy: 09:00-11:30, 12:30-13:30, 16:00-16:30
    ;; free slots: 11:30, 12:00, 13:30, 14:00, 14:30, 15:00, 15:30, 16:30
    (free lori s11_30) (free lori s12_00) (free lori s13_30) (free lori s14_00)
    (free lori s14_30) (free lori s15_00) (free lori s15_30) (free lori s16_30)

    ;; Preference encoded as a hard constraint: choose the earliest feasible common slot.
    ;; From intersection of all participants' free slots, the earliest common slot is 16:30 (s16_30).
    (acceptable s16_30)
  )

  ;; goal: schedule the meeting (planner will pick the acceptable slot that satisfies all free preconditions)
  (:goal (meeting-scheduled))
)