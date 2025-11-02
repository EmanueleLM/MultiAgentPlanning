(define (problem meeting-mon-morning)
  (:domain meeting-scheduling)

  (:objects
    amy jonathan brittany matthew catherine carl - participant

    s-09:00 s-09:30 s-10:00 s-10:30 s-11:00 s-11:30 s-12:00 s-12:30
    s-13:00 s-13:30 s-14:00 s-14:30 s-15:00 s-15:30 s-16:00 s-16:30 - slot
  )

  (:init
    (participant amy) (participant jonathan) (participant brittany)
    (participant matthew) (participant catherine) (participant carl)

    (slot s-09:00) (slot s-09:30) (slot s-10:00) (slot s-10:30)
    (slot s-11:00) (slot s-11:30) (slot s-12:00) (slot s-12:30)
    (slot s-13:00) (slot s-13:30) (slot s-14:00) (slot s-14:30)
    (slot s-15:00) (slot s-15:30) (slot s-16:00) (slot s-16:30)

    (= (total-cost) 0)

    (available amy s-09:00) (available amy s-09:30) (available amy s-10:00) (available amy s-10:30)
    (available amy s-11:00) (available amy s-11:30) (available amy s-12:00) (available amy s-12:30)
    (available amy s-13:30) (available amy s-14:00) (available amy s-14:30) (available amy s-15:00)
    (available amy s-16:00) (available amy s-16:30)

    (available jonathan s-09:30) (available jonathan s-10:30) (available jonathan s-11:00)
    (available jonathan s-12:00) (available jonathan s-13:00) (available jonathan s-13:30)
    (available jonathan s-14:00) (available jonathan s-14:30) (available jonathan s-15:00)
    (available jonathan s-15:30) (available jonathan s-16:00) (available jonathan s-16:30)

    (available brittany s-09:00) (available brittany s-10:00) (available brittany s-10:30)
    (available brittany s-11:00) (available brittany s-11:30) (available brittany s-12:00)
    (available brittany s-12:30) (available brittany s-13:00) (available brittany s-13:30)
    (available brittany s-14:00) (available brittany s-14:30) (available brittany s-15:00)
    (available brittany s-15:30) (available brittany s-16:00)

    (available matthew s-10:00) (available matthew s-10:30) (available matthew s-11:00)
    (available matthew s-11:30) (available matthew s-12:00) (available matthew s-14:30)
    (available matthew s-15:30) (available matthew s-16:30)

    (available catherine s-10:30) (available catherine s-11:00) (available catherine s-11:30)
    (available catherine s-14:00) (available catherine s-14:30) (available catherine s-15:00)
    (available catherine s-15:30) (available catherine s-16:00)

    (available carl s-09:00) (available carl s-09:30) (available carl s-11:00)
    (available carl s-12:30) (available carl s-14:00) (available carl s-16:30)
  )

  (:goal (scheduled))
  (:metric minimize (total-cost))
)