(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    david debra kevin - participant
    timeslot-09 timeslot-10 timeslot-11 timeslot-12 timeslot-13 timeslot-14 timeslot-15 timeslot-16 - hour
    meeting1 - meeting
  )

  (:init
    ;; David: no meetings the whole day (free all hours 09:00-17:00)
    (free david timeslot-09) (free david timeslot-10) (free david timeslot-11) (free david timeslot-12)
    (free david timeslot-13) (free david timeslot-14) (free david timeslot-15) (free david timeslot-16)

    ;; Debra busy: 09:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30
    ;; Thus Debra free for full hours: 10:00-11:00, 13:00-14:00, 15:00-16:00
    (free debra timeslot-10) (free debra timeslot-13) (free debra timeslot-15)

    ;; Kevin busy: 09:00-12:00 and 14:00-17:00
    ;; Thus Kevin free for full hours: 12:00-13:00 and 13:00-14:00
    (free kevin timeslot-12) (free kevin timeslot-13)

    (unscheduled meeting1)
  )

  (:goal (meeting_planned))
)