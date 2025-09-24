(define (problem schedule-meeting-monday-orchestrated)
  (:domain orchestrated-scheduling)
  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8
    slot9 slot10 slot11 slot12 slot13 slot14 slot15 slot16 - slot
    ralph peter daniel - person
  )
  (:init
    (unscheduled)
    (ralph_free slot1) (ralph_free slot2) (ralph_free slot3) (ralph_free slot4)
    (ralph_free slot5) (ralph_free slot6) (ralph_free slot7) (ralph_free slot8)
    (ralph_free slot9)
    (ralph_free slot11)
    (ralph_free slot13) (ralph_free slot14) (ralph_free slot15) (ralph_free slot16)
    (peter_free slot2) (peter_free slot3) (peter_free slot4) (peter_free slot9)
    (peter_free slot10) (peter_free slot11) (peter_free slot12) (peter_free slot13)
    (peter_free slot14) (peter_free slot16)
    (daniel_available slot3) (daniel_available slot14)
    (daniel_undesirable slot10) (daniel_undesirable slot11)
    (daniel_undesirable slot12) (daniel_undesirable slot13)
    (daniel_undesirable slot14) (daniel_undesirable slot15)
    (daniel_undesirable slot16)
  )
  (:goal (meeting_scheduled))
)