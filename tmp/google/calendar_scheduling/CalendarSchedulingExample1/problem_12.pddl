(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - time)

  (:init
    (blocked_raymond slot1) (blocked_raymond slot5) (blocked_raymond slot7) (blocked_raymond slot9)
    (blocked_billy slot2) (blocked_billy slot6) (blocked_billy slot16)
    (blocked_donald slot1) (blocked_donald slot2) (blocked_donald slot6) (blocked_donald slot8) (blocked_donald slot15)

    (preferred_time billy slot1) (preferred_time billy slot3) (preferred_time billy slot4) (preferred_time billy slot5)
    (preferred_time billy slot6) (preferred_time billy slot7) (preferred_time billy slot9) (preferred_time billy slot10)
    (preferred_time billy slot11) (preferred_time billy slot12) (preferred_time billy slot13) (preferred_time billy slot14)
  )

  (:goal
    (exists (?time - time) (meeting_set ?time)))
  
  (:metric minimize (total-cost))
)