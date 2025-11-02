(define (problem trip-instance-ams-vlc-tll)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    AMS VLC TLL - city
    L0 L1 L2 L3 L4 L5 L6 L7 - level
  )
  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)

    (first d1)
    (last d15)

    (direct AMS TLL)
    (direct TLL AMS)
    (direct VLC AMS)
    (direct AMS VLC)

    (in-window d9)
    (in-window d10)
    (in-window d11)
    (in-window d12)
    (in-window d13)
    (in-window d14)
    (in-window d15)

    (is-tll TLL)

    (next-level L7 L6)
    (next-level L6 L5)
    (next-level L5 L4)
    (next-level L4 L3)
    (next-level L3 L2)
    (next-level L2 L1)
    (next-level L1 L0)

    (is-bottom L0)

    (quota-level AMS L5)
    (quota-level VLC L5)
    (quota-level TLL L7)

    (= (total-cost) 0)
  )
  (:goal
    (and
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)
      (assigned d11)
      (assigned d12)
      (assigned d13)
      (assigned d14)
      (assigned d15)

      (visited AMS)
      (visited VLC)
      (visited TLL)

      (tll-window-satisfied)
      (schedule-complete)

      (quota-level AMS L0)
      (quota-level VLC L0)
      (quota-level TLL L0)
    )
  )
  (:metric minimize (total-cost))
)