(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Agents and 30-minute slots from 09:00-09:30 (slot1) to 16:30-17:00 (slot16)
  (:objects
    diane jack eugene patricia - agent
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
  )

  ;; Initial state: (free agent slot) facts only for slots not blocked by that agent.
  ;; Busy/blocked intervals from participants were interpreted as unavailable and therefore omitted.
  (:init
    ;; Diane is unavailable on slot2 (09:30-10:00) and slot12 (14:30-15:00).
    (free diane slot1) (free diane slot3) (free diane slot4) (free diane slot5)
    (free diane slot6) (free diane slot7) (free diane slot8) (free diane slot9)
    (free diane slot10) (free diane slot11) (free diane slot13) (free diane slot14)
    (free diane slot15) (free diane slot16)

    ;; Jack is unavailable on slot10 (13:30-14:00) and slot12 (14:30-15:00).
    (free jack slot1) (free jack slot2) (free jack slot3) (free jack slot4)
    (free jack slot5) (free jack slot6) (free jack slot7) (free jack slot8)
    (free jack slot9) (free jack slot11) (free jack slot13) (free jack slot14)
    (free jack slot15) (free jack slot16)

    ;; Eugene is unavailable on slots 1-2 (09:00-10:00), 4-5 (10:30-11:30),
    ;; 7-11 (12:00-14:30), and 13-15 (15:00-16:30).
    ;; Therefore free slots for Eugene are slot3 (10:00-10:30), slot6 (11:30-12:00),
    ;; slot12 (14:30-15:00), and slot16 (16:30-17:00).
    (free eugene slot3) (free eugene slot6) (free eugene slot12) (free eugene slot16)

    ;; Patricia is unavailable on slots 2-3 (09:30-10:30), 5-6 (11:00-12:00),
    ;; 8-10 (12:30-14:00), and 13-15 (15:00-16:30).
    ;; Therefore free slots for Patricia are slot1, slot4, slot7, slot11, slot12, slot16.
    (free patricia slot1) (free patricia slot4) (free patricia slot7)
    (free patricia slot11) (free patricia slot12) (free patricia slot16)
  )

  ;; Goal: schedule a single 30-minute meeting within the 09:00-17:00 workday that is compatible with all participants.
  ;; Based on the provided availabilities, the earliest and only common free slot is slot16 (16:30-17:00).
  (:goal (meeting-scheduled slot16))
)