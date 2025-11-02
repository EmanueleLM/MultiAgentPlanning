(define (problem schedule-meeting-integrated)
  (:domain meeting-scheduling)

  (:objects
    joyce christine alexander

    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30

    m1
  )

  (:init
    (slot s_09_00) (slot s_09_30) (slot s_10_00) (slot s_10_30)
    (slot s_11_00) (slot s_11_30) (slot s_12_00) (slot s_12_30)
    (slot s_13_00) (slot s_13_30) (slot s_14_00) (slot s_14_30)
    (slot s_15_00) (slot s_15_30) (slot s_16_00) (slot s_16_30)

    (within-hours s_09_00) (within-hours s_09_30) (within-hours s_10_00) (within-hours s_10_30)
    (within-hours s_11_00) (within-hours s_11_30) (within-hours s_12_00) (within-hours s_12_30)
    (within-hours s_13_00) (within-hours s_13_30) (within-hours s_14_00) (within-hours s_14_30)
    (within-hours s_15_00) (within-hours s_15_30) (within-hours s_16_00) (within-hours s_16_30)

    (participant joyce) (participant christine) (participant alexander)

    (busy joyce s_11_00)
    (busy joyce s_13_30)
    (busy joyce s_14_30) (busy joyce s_15_00) (busy joyce s_15_30) (busy joyce s_16_00)

    (busy christine s_09_00) (busy christine s_09_30)
    (busy christine s_10_00) (busy christine s_10_30)
    (busy christine s_11_00) (busy christine s_11_30)

    (busy alexander s_09_00) (busy alexander s_09_30)
    (busy alexander s_10_00) (busy alexander s_10_30)
    (busy alexander s_12_00)
    (busy alexander s_13_30) (busy alexander s_14_00) (busy alexander s_14_30)
    (busy alexander s_15_30)
    (busy alexander s_16_30)

    (meeting m1)
    (meeting-duration-30)
  )

  (:goal (and
    (scheduled_at m1 s_12_30)
    (attends-joyce m1 s_12_30)
    (attends-christine m1 s_12_30)
    (attends-alexander m1 s_12_30)
  ))
)