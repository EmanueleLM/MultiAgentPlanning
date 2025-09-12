(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot)

  (:init
    (blocked_raymond slot1) (blocked_raymond slot5) (blocked_raymond slot7) (blocked_raymond slot9)
    (blocked_billy slot2) (blocked_billy slot6) (blocked_billy slot16)
    (blocked_donald slot1) (blocked_donald slot2) (blocked_donald slot6) (blocked_donald slot8) (blocked_donald slot15)

    (preferred_time_billy slot3) (preferred_time_billy slot4) (preferred_time_billy slot5)
    (preferred_time_billy slot7) (preferred_time_billy slot9) (preferred_time_billy slot10)
    (preferred_time_billy slot11) (preferred_time_billy slot12) (preferred_time_billy slot13) (preferred_time_billy slot14)
  )

  (:goal
    (exists (?slot - slot) (meeting_set ?slot)))
  
  (:metric minimize (total-cost))
)