(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling-integrated)

  (:objects
    nicholas emma catherine steven adam lori - participant
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    meeting1 - meeting
  )

  (:init
    ;; declare participants, slots, meeting
    (participant nicholas) (participant emma) (participant catherine)
    (participant steven) (participant adam) (participant lori)
    (slot slot1) (slot slot2) (slot slot3) (slot slot4)
    (slot slot5) (slot slot6) (slot slot7) (slot slot8)
    (slot slot9) (slot slot10) (slot slot11) (slot slot12)
    (slot slot13) (slot slot14) (slot slot15) (slot slot16)
    (meeting meeting1)

    ;; Integrated availability facts gathered from the agents' inputs.
    ;; We include only explicit free facts provided by agents (resolved conservatively
    ;; when agents provided explicit busy constraints).
    ;;
    ;; nicholas: reported free all day (per agents 1 & 3 & 4)
    (free nicholas slot1)  (free nicholas slot2)  (free nicholas slot3)  (free nicholas slot4)
    (free nicholas slot5)  (free nicholas slot6)  (free nicholas slot7)  (free nicholas slot8)
    (free nicholas slot9)  (free nicholas slot10) (free nicholas slot11) (free nicholas slot12)
    (free nicholas slot13) (free nicholas slot14) (free nicholas slot15) (free nicholas slot16)

    ;; emma: reported free all day (per agents 2 & 3 & 4)
    (free emma slot1)  (free emma slot2)  (free emma slot3)  (free emma slot4)
    (free emma slot5)  (free emma slot6)  (free emma slot7)  (free emma slot8)
    (free emma slot9)  (free emma slot10) (free emma slot11) (free emma slot12)
    (free emma slot13) (free emma slot14) (free emma slot15) (free emma slot16)

    ;; catherine: agent 3 supplied explicit busy slots {slot1, slot6, slot10, slot14},
    ;; agent 4 listed all slots as available but we respect explicit busy entries.
    ;; So catherine free = all slots except 1,6,10,14.
    (free catherine slot2)  (free catherine slot3)  (free catherine slot4)
    (free catherine slot5)  (free catherine slot7)  (free catherine slot8)
    (free catherine slot9)  (free catherine slot11) (free catherine slot12)
    (free catherine slot13) (free catherine slot15) (free catherine slot16)

    ;; steven: agent 4 provided explicit availability (only slot2 and slot16);
    ;; agent 3 reported him free all slots but agent 4's specifics are taken into account.
    (free steven slot2) (free steven slot16)

    ;; adam: agent 5 provided explicit free slots: slot3, slot9, slot11, slot16.
    (free adam slot3) (free adam slot9) (free adam slot11) (free adam slot16)

    ;; lori: agent 6 provided explicit free slots (after considering her busy intervals):
    ;; free at slots 6,7,10,11,12,13,14,16
    (free lori slot6) (free lori slot7) (free lori slot10) (free lori slot11)
    (free lori slot12) (free lori slot13) (free lori slot14) (free lori slot16)
  )

  ;; Goal: schedule the 30-minute meeting for all participants within Monday 09:00-17:00.
  ;; Based on the integrated availability facts above, slot16 (16:30-17:00) is feasible
  ;; for all six participants. The coordinator action schedule_all_participants can be used
  ;; by the planner to achieve the goal.
  (:goal (and (scheduled meeting1 slot16)))
)