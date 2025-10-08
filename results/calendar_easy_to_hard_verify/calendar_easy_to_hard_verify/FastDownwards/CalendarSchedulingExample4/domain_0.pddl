(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; An action to schedule the meeting at a specific slot.
  ;; Preconditions: all agents are free at that slot and no meeting already scheduled.
  ;; Effects: mark meeting scheduled and mark the slot scheduled and remove free facts for the slot.
  ;; Each action increases total-cost by a slot-specific integer; minimizing total-cost yields the earliest slot.
  (:action schedule-s0900
    :precondition (and (free donna s0900) (free john s0900) (free billy s0900) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s0900)
                 (not (free donna s0900)) (not (free john s0900)) (not (free billy s0900))
                 (increase (total-cost) 0))
  )
  (:action schedule-s0930
    :precondition (and (free donna s0930) (free john s0930) (free billy s0930) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s0930)
                 (not (free donna s0930)) (not (free john s0930)) (not (free billy s0930))
                 (increase (total-cost) 30))
  )
  (:action schedule-s1000
    :precondition (and (free donna s1000) (free john s1000) (free billy s1000) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1000)
                 (not (free donna s1000)) (not (free john s1000)) (not (free billy s1000))
                 (increase (total-cost) 60))
  )
  (:action schedule-s1030
    :precondition (and (free donna s1030) (free john s1030) (free billy s1030) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1030)
                 (not (free donna s1030)) (not (free john s1030)) (not (free billy s1030))
                 (increase (total-cost) 90))
  )
  (:action schedule-s1100
    :precondition (and (free donna s1100) (free john s1100) (free billy s1100) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1100)
                 (not (free donna s1100)) (not (free john s1100)) (not (free billy s1100))
                 (increase (total-cost) 120))
  )
  (:action schedule-s1130
    :precondition (and (free donna s1130) (free john s1130) (free billy s1130) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1130)
                 (not (free donna s1130)) (not (free john s1130)) (not (free billy s1130))
                 (increase (total-cost) 150))
  )
  (:action schedule-s1200
    :precondition (and (free donna s1200) (free john s1200) (free billy s1200) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1200)
                 (not (free donna s1200)) (not (free john s1200)) (not (free billy s1200))
                 (increase (total-cost) 180))
  )
  (:action schedule-s1230
    :precondition (and (free donna s1230) (free john s1230) (free billy s1230) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1230)
                 (not (free donna s1230)) (not (free john s1230)) (not (free billy s1230))
                 (increase (total-cost) 210))
  )
  (:action schedule-s1300
    :precondition (and (free donna s1300) (free john s1300) (free billy s1300) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1300)
                 (not (free donna s1300)) (not (free john s1300)) (not (free billy s1300))
                 (increase (total-cost) 240))
  )
  (:action schedule-s1330
    :precondition (and (free donna s1330) (free john s1330) (free billy s1330) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1330)
                 (not (free donna s1330)) (not (free john s1330)) (not (free billy s1330))
                 (increase (total-cost) 270))
  )
  (:action schedule-s1400
    :precondition (and (free donna s1400) (free john s1400) (free billy s1400) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1400)
                 (not (free donna s1400)) (not (free john s1400)) (not (free billy s1400))
                 (increase (total-cost) 300))
  )
  (:action schedule-s1430
    :precondition (and (free donna s1430) (free john s1430) (free billy s1430) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1430)
                 (not (free donna s1430)) (not (free john s1430)) (not (free billy s1430))
                 (increase (total-cost) 330))
  )
  (:action schedule-s1500
    :precondition (and (free donna s1500) (free john s1500) (free billy s1500) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1500)
                 (not (free donna s1500)) (not (free john s1500)) (not (free billy s1500))
                 (increase (total-cost) 360))
  )
  (:action schedule-s1530
    :precondition (and (free donna s1530) (free john s1530) (free billy s1530) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1530)
                 (not (free donna s1530)) (not (free john s1530)) (not (free billy s1530))
                 (increase (total-cost) 390))
  )
  (:action schedule-s1600
    :precondition (and (free donna s1600) (free john s1600) (free billy s1600) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1600)
                 (not (free donna s1600)) (not (free john s1600)) (not (free billy s1600))
                 (increase (total-cost) 420))
  )
  (:action schedule-s1630
    :precondition (and (free donna s1630) (free john s1630) (free billy s1630) (not (meeting-scheduled)))
    :effect (and (meeting-scheduled) (scheduled s1630)
                 (not (free donna s1630)) (not (free john s1630)) (not (free billy s1630))
                 (increase (total-cost) 450))
  )
)