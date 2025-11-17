(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    jesse kathryn megan - participant
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot
  )

  (:init
    ;; Jesse: busy 10:00-10:30 (t10_00) and 15:30-16:00 (t15_30) -> free otherwise
    (free jesse t09_00) (free jesse t09_30)
    (free jesse t10_30) (free jesse t11_00) (free jesse t11_30)
    (free jesse t12_00) (free jesse t12_30) (free jesse t13_00)
    (free jesse t13_30) (free jesse t14_00) (free jesse t14_30)
    (free jesse t15_00) (free jesse t16_00) (free jesse t16_30)

    ;; Kathryn: free all day 09:00-17:00
    (free kathryn t09_00) (free kathryn t09_30) (free kathryn t10_00) (free kathryn t10_30)
    (free kathryn t11_00) (free kathryn t11_30) (free kathryn t12_00) (free kathryn t12_30)
    (free kathryn t13_00) (free kathryn t13_30) (free kathryn t14_00) (free kathryn t14_30)
    (free kathryn t15_00) (free kathryn t15_30) (free kathryn t16_00) (free kathryn t16_30)

    ;; Megan: busy 10:30-11:00 (t10_30), 11:30-12:30 (t11_30,t12_00),
    ;;        13:30-14:30 (t13_30,t14_00), 15:00-16:30 (t15_00,t15_30,t16_00)
    ;; -> free otherwise
    (free megan t09_00) (free megan t09_30) (free megan t10_00)
    (free megan t11_00) (free megan t12_30)
    (free megan t13_00) (free megan t14_30) (free megan t16_30)
  )

  ;; Goal: schedule the meeting at the earliest feasible slot (09:00)
  (:goal (scheduled t09_00))
)