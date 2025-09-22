(define (problem schedule-monday-09-17)
  (:domain multiagent-scheduling)

  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
  )

  (:init
    ;; Donald available: 09:00-09:30(slot0), 10:00-10:30(slot2), 10:30-11:00(slot3), 12:30-13:00(slot7),
    ;; 13:00-13:30(slot8), 13:30-14:00(slot9), 14:00-14:30(slot10), 15:00-15:30(slot12), 15:30-16:00(slot13), 16:00-16:30(slot14)
    (available donald slot0)
    (available donald slot2)
    (available donald slot3)
    (available donald slot7)
    (available donald slot8)
    (available donald slot9)
    (available donald slot10)
    (available donald slot12)
    (available donald slot13)
    (available donald slot14)

    ;; Zachary available: slot1, slot2, slot5, slot7, slot10, slot11, slot12, slot13, slot14, slot15
    (available zachary slot1)
    (available zachary slot2)
    (available zachary slot5)
    (available zachary slot7)
    (available zachary slot10)
    (available zachary slot11)
    (available zachary slot12)
    (available zachary slot13)
    (available zachary slot14)
    (available zachary slot15)

    ;; Kathryn available: all slots 0..15
    (available kathryn slot0)
    (available kathryn slot1)
    (available kathryn slot2)
    (available kathryn slot3)
    (available kathryn slot4)
    (available kathryn slot5)
    (available kathryn slot6)
    (available kathryn slot7)
    (available kathryn slot8)
    (available kathryn slot9)
    (available kathryn slot10)
    (available kathryn slot11)
    (available kathryn slot12)
    (available kathryn slot13)
    (available kathryn slot14)
    (available kathryn slot15)

    ;; Deborah available: slot1, slot3, slot4, slot6, slot7, slot9
    (available deborah slot1)
    (available deborah slot3)
    (available deborah slot4)
    (available deborah slot6)
    (available deborah slot7)
    (available deborah slot9)

    ;; Teresa available: slot1, slot4, slot7, slot8, slot9, slot11, slot14, slot15
    (available teresa slot1)
    (available teresa slot4)
    (available teresa slot7)
    (available teresa slot8)
    (available teresa slot9)
    (available teresa slot11)
    (available teresa slot14)
    (available teresa slot15)

    ;; James available: slot0, slot3, slot7, slot10
    (available james slot0)
    (available james slot3)
    (available james slot7)
    (available james slot10)
  )

  (:goal (meeting-time slot7))
)