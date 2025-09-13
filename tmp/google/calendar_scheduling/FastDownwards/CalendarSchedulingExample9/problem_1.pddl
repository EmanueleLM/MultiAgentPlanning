(define (problem integrated_schedule_meeting_problem)
    (:domain integrated_meeting_scheduler)

    (:objects
        diane deborah kelly - person
        slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - time-slot
    )
    
    (:init
        (free diane slot1) (free deborah slot1)
        (free diane slot2) (free deborah slot2)
        (free diane slot3) (free deborah slot3)
        (free diane slot4) (free deborah slot4)
        (free diane slot5) (free deborah slot5)
        (free diane slot6) (free deborah slot6)
        (free diane slot7) (free deborah slot7)
        (free diane slot8) (free deborah slot8)
        (free diane slot9) (free deborah slot9)
        (free diane slot10) (free deborah slot10)
        (free diane slot11) (free deborah slot11)
        (free diane slot12) (free deborah slot12)

        (available diane slot1) (available kelly slot1) (available deborah slot1)
        (available diane slot2) (available deborah slot2)
        (available diane slot3) (available kelly slot3) (available deborah slot3)
        (available deborah slot4) (available kelly slot5)
        (available deborah slot5) (available kelly slot7)
        (available deborah slot6) 
        (available deborah slot7) (available kelly slot9)
        (available deborah slot8) 
        (available deborah slot9) (available kelly slot11)
        (available deborah slot10) 
        (available deborah slot11) 
        (available deborah slot12) 
    )
    
    (:goal
        (meeting_scheduled)
    )
)