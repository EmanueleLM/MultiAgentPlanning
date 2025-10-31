(define (problem schedule-instance-A)
  (:domain meeting-scheduling)
  (:objects
    t1 t2 t3 - slot
    r1 - room
    alice bob - person
    proj1 - equipment
    mA - meeting
  )

  (:init
    (slot t1) (slot t2) (slot t3)
    (room r1)
    (person alice) (person bob)
    (equipment proj1)
    (meeting mA)
    (free t2) (free t3)
    (room_free r1 t2) (room_free r1 t3)
    (equipment_free proj1 t2)
    (available alice t2)
    (available bob t2)
  )

  (:goal (and
    (meeting_scheduled mA t2)
    (confirmed alice mA)
    (confirmed bob mA)
    (equipment_set proj1 t2)
  ))
)