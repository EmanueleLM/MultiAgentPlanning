(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (chosen_start ?s - slot)
    (chosen_second ?s - slot)
    (scheduled)
  )

  (:action select_start
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (not (scheduled))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (chosen_start s_0900_0930))
      (not (chosen_start s_0930_1000))
      (not (chosen_start s_1000_1030))
      (not (chosen_start s_1030_1100))
      (not (chosen_start s_1100_1130))
      (not (chosen_start s_1130_1200))
      (not (chosen_start s_1200_1230))
      (not (chosen_start s_1230_1300))
      (not (chosen_start s_1300_1330))
      (not (chosen_start s_1330_1400))
      (not (chosen_start s_1400_1430))
      (not (chosen_start s_1430_1500))
      (not (chosen_start s_1500_1530))
      (not (chosen_start s_1530_1600))
      (not (chosen_start s_1600_1630))
      (not (chosen_start s_1630_1700))
    )
    :effect (and
      (chosen_start ?s)
    )
  )

  (:action select_second
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s1 - slot ?s2 - slot)
    :precondition (and
      (not (scheduled))
      (chosen_start ?s1)
      (next_slot ?s1 ?s2)
      (free ?p1 ?s2)
      (free ?p2 ?s2)
      (free ?p3 ?s2)
      (not (chosen_second s_0900_0930))
      (not (chosen_second s_0930_1000))
      (not (chosen_second s_1000_1030))
      (not (chosen_second s_1030_1100))
      (not (chosen_second s_1100_1130))
      (not (chosen_second s_1130_1200))
      (not (chosen_second s_1200_1230))
      (not (chosen_second s_1230_1300))
      (not (chosen_second s_1300_1330))
      (not (chosen_second s_1330_1400))
      (not (chosen_second s_1400_1430))
      (not (chosen_second s_1430_1500))
      (not (chosen_second s_1500_1530))
      (not (chosen_second s_1530_1600))
      (not (chosen_second s_1600_1630))
      (not (chosen_second s_1630_1700))
    )
    :effect (and
      (chosen_second ?s2)
    )
  )

  (:action finalize_schedule
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (chosen_start ?s1)
      (chosen_second ?s2)
      (next_slot ?s1 ?s2)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
    )
  )
)