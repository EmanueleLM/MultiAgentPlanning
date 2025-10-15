(define (problem meeting-mon-morning)
  (:domain meeting-scheduling)

  (:objects
    amy jonathan brittany matthew catherine carl - participant

    s-09_00 s-09_30 s-10_00 s-10_30 s-11_00 s-11_30 s-12_00 s-12_30
    s-13_00 s-13_30 s-14_00 s-14_30 s-15_00 s-15_30 s-16_00 s-16_30 - slot
  )

  (:init
    (participant amy) (participant jonathan) (participant brittany)
    (participant matthew) (participant catherine) (participant carl)

    (slot s-09_00) (slot s-09_30) (slot s-10_00) (slot s-10_30)
    (slot s-11_00) (slot s-11_30) (slot s-12_00) (slot s-12_30)
    (slot s-13_00) (slot s-13_30) (slot s-14_00) (slot s-14_30)
    (slot s-15_00) (slot s-15_30) (slot s-16_00) (slot s-16_30)

    (= (total-cost) 0)

    (available amy s-09_00) (available amy s-09_30) (available amy s-10_00) (available amy s-10_30)
    (available amy s-11_00) (available amy s-11_30) (available amy s-12_00) (available amy s-12_30)
    (available amy s-13_30) (available amy s-14_00) (available amy s-14_30) (available amy s-15_00)
    (available amy s-16_00) (available amy s-16_30)

    (available jonathan s-09_30) (available jonathan s-10_30) (available jonathan s-11_00)
    (available jonathan s-12_00) (available jonathan s-13_00) (available jonathan s-13_30)
    (available jonathan s-14_00) (available jonathan s-14_30) (available jonathan s-15_00)
    (available jonathan s-15_30) (available jonathan s-16_00) (available jonathan s-16_30)

    (available brittany s-09_00) (available brittany s-10_00) (available brittany s-10_30)
    (available brittany s-11_00) (available brittany s-11_30) (available brittany s-12_00)
    (available brittany s-12_30) (available brittany s-13_00) (available brittany s-13_30)
    (available brittany s-14_00) (available brittany s-14_30) (available brittany s-15_00)
    (available brittany s-15_30) (available brittany s-16_00)

    (available matthew s-10_00) (available matthew s-10_30) (available matthew s-11_00)
    (available matthew s-11_30) (available matthew s-12_00) (available matthew s-14_30)
    (available matthew s-15_30) (available matthew s-16_30)

    (available catherine s-10_30) (available catherine s-11_00) (available catherine s-11_30)
    (available catherine s-14_00) (available catherine s-14_30) (available catherine s-15_00)
    (available catherine s-15_30) (available catherine s-16_00)

    (available carl s-09_00) (available carl s-09_30) (available carl s-11_00)
    (available carl s-12_30) (available carl s-14_00) (available carl s-16_30)
  )

  (:goal (scheduled))
  (:metric minimize (total-cost))
)