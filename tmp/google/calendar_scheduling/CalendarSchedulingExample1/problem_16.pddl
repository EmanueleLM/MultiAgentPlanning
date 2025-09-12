(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot)

  (:init
    (blocked raymond slot1) (blocked raymond slot5) (blocked raymond slot7) (blocked raymond slot9)
    (blocked billy slot2) (blocked billy slot6) (blocked billy slot16)
    (blocked donald slot1) (blocked donald slot2) (blocked donald slot6) (blocked donald slot8) (blocked donald slot15)

    (preferred_time_billy slot3) (preferred_time_billy slot4) (preferred_time_billy slot5) (preferred_time_billy slot7) (preferred_time_billy slot9)
    (preferred_time_billy slot10) (preferred_time_billy slot11) (preferred_time_billy slot12) (preferred_time_billy slot13) (preferred_time_billy slot14)
  )

  (:goal
    (exists (?slot - slot) (meeting_set ?slot)))
  
  (:metric minimize (total-cost))
  
  (:preferences
    (or (meeting_set slot3) (meeting_set slot4) (meeting_set slot10) (meeting_set slot11) (meeting_set slot12) (meeting_set slot13) (meeting_set slot14))
  )
)