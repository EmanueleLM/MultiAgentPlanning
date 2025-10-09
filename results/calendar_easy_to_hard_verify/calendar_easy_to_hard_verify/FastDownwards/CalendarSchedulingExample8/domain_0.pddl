(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  ;; Actions: one action per discrete 30-minute slot.
  ;; Each action requires that the slot is free for all participants
  ;; and that no meeting has yet been scheduled. The effect marks
  ;; the meeting as scheduled at that slot. A numeric cost is attached
  ;; to prefer earlier slots (lower cost = earlier).
  (:action schedule-slot1
    :precondition (and (not (meeting-scheduled))
                       (free adam slot1)
                       (free jerry slot1)
                       (free matthew slot1))
    :effect (and (meeting-scheduled) (scheduled slot1))
    :cost 1)

  (:action schedule-slot2
    :precondition (and (not (meeting-scheduled))
                       (free adam slot2)
                       (free jerry slot2)
                       (free matthew slot2))
    :effect (and (meeting-scheduled) (scheduled slot2))
    :cost 2)

  (:action schedule-slot3
    :precondition (and (not (meeting-scheduled))
                       (free adam slot3)
                       (free jerry slot3)
                       (free matthew slot3))
    :effect (and (meeting-scheduled) (scheduled slot3))
    :cost 3)

  (:action schedule-slot4
    :precondition (and (not (meeting-scheduled))
                       (free adam slot4)
                       (free jerry slot4)
                       (free matthew slot4))
    :effect (and (meeting-scheduled) (scheduled slot4))
    :cost 4)

  (:action schedule-slot5
    :precondition (and (not (meeting-scheduled))
                       (free adam slot5)
                       (free jerry slot5)
                       (free matthew slot5))
    :effect (and (meeting-scheduled) (scheduled slot5))
    :cost 5)

  (:action schedule-slot6
    :precondition (and (not (meeting-scheduled))
                       (free adam slot6)
                       (free jerry slot6)
                       (free matthew slot6))
    :effect (and (meeting-scheduled) (scheduled slot6))
    :cost 6)

  (:action schedule-slot7
    :precondition (and (not (meeting-scheduled))
                       (free adam slot7)
                       (free jerry slot7)
                       (free matthew slot7))
    :effect (and (meeting-scheduled) (scheduled slot7))
    :cost 7)

  (:action schedule-slot8
    :precondition (and (not (meeting-scheduled))
                       (free adam slot8)
                       (free jerry slot8)
                       (free matthew slot8))
    :effect (and (meeting-scheduled) (scheduled slot8))
    :cost 8)

  (:action schedule-slot9
    :precondition (and (not (meeting-scheduled))
                       (free adam slot9)
                       (free jerry slot9)
                       (free matthew slot9))
    :effect (and (meeting-scheduled) (scheduled slot9))
    :cost 9)

  (:action schedule-slot10
    :precondition (and (not (meeting-scheduled))
                       (free adam slot10)
                       (free jerry slot10)
                       (free matthew slot10))
    :effect (and (meeting-scheduled) (scheduled slot10))
    :cost 10)

  (:action schedule-slot11
    :precondition (and (not (meeting-scheduled))
                       (free adam slot11)
                       (free jerry slot11)
                       (free matthew slot11))
    :effect (and (meeting-scheduled) (scheduled slot11))
    :cost 11)

  (:action schedule-slot12
    :precondition (and (not (meeting-scheduled))
                       (free adam slot12)
                       (free jerry slot12)
                       (free matthew slot12))
    :effect (and (meeting-scheduled) (scheduled slot12))
    :cost 12)

  (:action schedule-slot13
    :precondition (and (not (meeting-scheduled))
                       (free adam slot13)
                       (free jerry slot13)
                       (free matthew slot13))
    :effect (and (meeting-scheduled) (scheduled slot13))
    :cost 13)

  (:action schedule-slot14
    :precondition (and (not (meeting-scheduled))
                       (free adam slot14)
                       (free jerry slot14)
                       (free matthew slot14))
    :effect (and (meeting-scheduled) (scheduled slot14))
    :cost 14)

  (:action schedule-slot15
    :precondition (and (not (meeting-scheduled))
                       (free adam slot15)
                       (free jerry slot15)
                       (free matthew slot15))
    :effect (and (meeting-scheduled) (scheduled slot15))
    :cost 15)

  (:action schedule-slot16
    :precondition (and (not (meeting-scheduled))
                       (free adam slot16)
                       (free jerry slot16)
                       (free matthew slot16))
    :effect (and (meeting-scheduled) (scheduled slot16))
    :cost 16)
)