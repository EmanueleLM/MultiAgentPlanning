(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (available ronald s09_00) (available ronald s09_30) (available ronald s10_00) (available ronald s10_30)
    (available ronald s11_00) (available ronald s11_30) (available ronald s12_00) (available ronald s12_30)
    (available ronald s13_00) (available ronald s13_30) (available ronald s14_00) (available ronald s14_30)
    (available ronald s15_00) (available ronald s15_30) (available ronald s16_00) (available ronald s16_30)

    (available stephen s09_00) (available stephen s09_30) (available stephen s10_30)
    (available stephen s11_00) (available stephen s11_30) (available stephen s12_30)
    (available stephen s13_00) (available stephen s13_30) (available stephen s14_00)
    (available stephen s14_30) (available stephen s15_00) (available stephen s15_30)
    (available stephen s16_00) (available stephen s16_30)

    (available brittany s09_00) (available brittany s09_30) (available brittany s10_00) (available brittany s10_30)
    (available brittany s11_30) (available brittany s12_00) (available brittany s12_30)
    (available brittany s13_00) (available brittany s14_00) (available brittany s14_30)
    (available brittany s15_00) (available brittany s16_00)

    (available dorothy s09_30) (available dorothy s10_30) (available dorothy s12_30) (available dorothy s15_00)

    (available rebecca s09_00) (available rebecca s10_30) (available rebecca s11_30) (available rebecca s12_30)

    (available jordan s09_30) (available jordan s11_00) (available jordan s12_00) (available jordan s12_30)
    (available jordan s15_00) (available jordan s16_30)
  )
  (:goal (meeting-scheduled))
)