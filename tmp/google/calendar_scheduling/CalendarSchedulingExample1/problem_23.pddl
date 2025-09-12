(define (problem schedule_meeting_popf2)
  (:domain meeting_scheduler_popf2)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot)

  (:init
    (blocked raymond slot1) (blocked raymond slot5) (blocked raymond slot7) (blocked raymond slot9)
    (blocked billy slot2) (blocked billy slot6) (blocked billy slot16)
    (blocked donald slot1) (blocked donald slot2) (blocked donald slot6) (blocked donald slot8) (blocked donald slot15)

    (preferred_time_billy slot1) (preferred_time_billy slot2) (preferred_time_billy slot3) (preferred_time_billy slot4) 
    (preferred_time_billy slot5) (preferred_time_billy slot6) (preferred_time_billy slot7) (preferred_time_billy slot8) 
    (preferred_time_billy slot9) (preferred_time_billy slot10) (preferred_time_billy slot11) (preferred_time_billy slot12) 
    (preferred_time_billy slot13) (preferred_time_billy slot14) (preferred_time_billy slot15) (preferred_time_billy slot16)
  )

  (:goal
    (exists (?slot - slot) (and (meeting_set ?slot)
                (preferred_time_billy ?slot))))

  (:metric minimize (cost_exceeded))
)