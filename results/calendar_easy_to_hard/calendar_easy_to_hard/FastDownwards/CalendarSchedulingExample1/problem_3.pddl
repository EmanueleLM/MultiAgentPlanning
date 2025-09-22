(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 - slot
  )

  (:init
    (work-slot slot1) (work-slot slot2) (work-slot slot3) (work-slot slot4)
    (work-slot slot5) (work-slot slot6) (work-slot slot7) (work-slot slot8)

    (available raymond slot2) (available raymond slot3) (available raymond slot4)
    (available billy  slot1) (available billy  slot3) (available billy  slot5)
    (available donald slot3) (available donald slot4) (available donald slot6)

    (preferred raymond slot3)
    (preferred billy  slot3)
    (preferred donald slot3)
  )

  (:goal
    (meeting-scheduled)
  )
)