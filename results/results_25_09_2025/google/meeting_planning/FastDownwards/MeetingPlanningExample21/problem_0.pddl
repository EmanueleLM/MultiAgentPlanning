(define (problem meet-margaret-problem)
  (:domain meetings)
  (:objects
    visitor margaret - agent
    missiondistrict haightashbury - location
  )

  (:init
    ;; Initial locations
    (at visitor missiondistrict)
    (at margaret haightashbury)

    ;; Both initially free
    (free visitor)
    (free margaret)

    ;; Time and availability parameters (minutes since midnight)
    ;; Visitor arrives Mission District at 09:00 -> 9*60 = 540
    (= (time) 540)

    ;; Margaret availability: 08:00 (480) to 15:45 (15*60 + 45 = 945)
    (= (marg_start) 480)
    (= (marg_end) 945)

    ;; Minimum meeting duration required (30 minutes)
    (= (min_meet) 30)
  )

  ;; Global goal: meet for at least the minimum duration
  (:goal (met))
)