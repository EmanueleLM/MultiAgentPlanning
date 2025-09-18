(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    david debra kevin - participant
    timeslot-09 timeslot-10 timeslot-11 timeslot-12 timeslot-13 timeslot-14 timeslot-15 timeslot-16 - hour
    meeting1 - meeting
  )
  (:init
    (free david timeslot-09) (free david timeslot-10) (free david timeslot-11) (free david timeslot-12)
    (free david timeslot-13) (free david timeslot-14) (free david timeslot-15) (free david timeslot-16)

    (free debra timeslot-10) (free debra timeslot-13) (free debra timeslot-15)

    (free kevin timeslot-12) (free kevin timeslot-13)

    (unscheduled meeting1)
  )
  (:goal (meeting_planned))
)