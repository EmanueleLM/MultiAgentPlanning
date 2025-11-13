(define (problem trip14days-instance)
  (:domain trip14days)
  (:objects
    florence barcelona helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    lv0 lv1 lv2 lv3 lv4 lv5 lv6 - level
  )
  (:init
    ; Identify cities
    (is-florence florence)
    (is-barcelona barcelona)
    (is-helsinki helsinki)

    ; Direct flights (bidirectional where provided)
    (direct florence barcelona)
    (direct barcelona florence)
    (direct barcelona helsinki)
    (direct helsinki barcelona)

    ; Day succession and endpoints
    (first d1)
    (last d14)
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

    ; Meeting window days (inclusive 9..14)
    (in-window d9)
    (in-window d10)
    (in-window d11)
    (in-window d12)
    (in-window d13)
    (in-window d14)

    ; Quota counters start at zero for each city
    (current-count florence lv0)
    (current-count barcelona lv0)
    (current-count helsinki lv0)

    ; Successor relation for levels
    (succ lv0 lv1)
    (succ lv1 lv2)
    (succ lv2 lv3)
    (succ lv3 lv4)
    (succ lv4 lv5)
    (succ lv5 lv6)

    ; City-specific maximum levels (targets)
    (max-level florence lv6)   ; desired 6
    (max-level barcelona lv5)  ; desired 5
    (max-level helsinki lv5)   ; desired 5
  )
  (:goal (and
    (sealed)
    (met)
    (quota-closed florence)
    (quota-closed barcelona)
    (quota-closed helsinki)
  ))
  (:metric minimize (total-cost))
)