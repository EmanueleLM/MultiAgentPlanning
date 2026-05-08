(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - timeslot
  )

  (:init
    (current_slot t_0900)

    (next_slot t_0900 t_0930)
    (next_slot t_0930 t_1000)
    (next_slot t_1000 t_1030)
    (next_slot t_1030 t_1100)
    (next_slot t_1100 t_1130)
    (next_slot t_1130 t_1200)
    (next_slot t_1200 t_1230)
    (next_slot t_1230 t_1300)
    (next_slot t_1300 t_1330)
    (next_slot t_1330 t_1400)
    (next_slot t_1400 t_1430)
    (next_slot t_1430 t_1500)
    (next_slot t_1500 t_1530)
    (next_slot t_1530 t_1600)
    (next_slot t_1600 t_1630)

    (required_attendee meeting_1 brittany)
    (required_attendee meeting_1 emily)
    (required_attendee meeting_1 doris)

    (participant_free brittany t_0900)
    (participant_free brittany t_0930)
    (participant_free brittany t_1000)
    (participant_free brittany t_1030)
    (participant_free brittany t_1100)
    (participant_free brittany t_1130)
    (participant_free brittany t_1200)
    (participant_free brittany t_1230)
    (participant_free brittany t_1330)
    (participant_free brittany t_1400)
    (participant_free brittany t_1430)
    (participant_free brittany t_1500)
    (participant_free brittany t_1530)
    (participant_free brittany t_1630)

    (participant_free emily t_0900)
    (participant_free emily t_0930)
    (participant_free emily t_1000)
    (participant_free emily t_1030)
    (participant_free emily t_1100)
    (participant_free emily t_1130)
    (participant_free emily t_1200)
    (participant_free emily t_1230)
    (participant_free emily t_1300)
    (participant_free emily t_1330)
    (participant_free emily t_1400)
    (participant_free emily t_1430)
    (participant_free emily t_1500)
    (participant_free emily t_1530)
    (participant_free emily t_1600)
    (participant_free emily t_1630)

    (participant_free doris t_1100)
    (participant_free doris t_1430)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
      (scheduled_at meeting_1 t_1100)
    )
  )
)