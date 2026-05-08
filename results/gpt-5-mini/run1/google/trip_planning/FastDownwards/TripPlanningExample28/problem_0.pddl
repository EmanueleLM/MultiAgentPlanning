; Problem: visit-trip-problem
; Assumptions restated:
; - Visiting days are day1..day12 (exactly 12).
; - Additional book-keeping days: day0 (initial), day13 (post-trip return day).
; - City objects: home, venice, florence, zurich. Only venice/florence/zurich are visit cities.
; - Direct flights are only those listed below; no other connectivity exists.

(define (problem visit-trip-problem)
  (:domain travel-domain)

  (:objects
    home venice florence zurich - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ; successor links to enforce day order
    (succ day0 day1) (succ day1 day2) (succ day2 day3) (succ day3 day4)
    (succ day4 day5) (succ day5 day6) (succ day6 day7) (succ day7 day8)
    (succ day8 day9) (succ day9 day10) (succ day10 day11) (succ day11 day12)
    (succ day12 day13)

    ; exactly the 12 visiting days are initially unassigned (day1..day12)
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)

    ; initial location: traveller starts at home on day0
    (at home day0)

    ; mark which cities are visit cities
    (visitcity venice) (visitcity florence) (visitcity zurich)

    ; Direct flights allowed (explicit, conservative):
    ; - Start: home -> venice (to begin the trip)
    ; - leg 1: venice -> florence
    ; - leg 2: florence -> zurich
    ; - return: zurich -> home (post-trip)
    (directflight home venice)
    (directflight venice florence)
    (directflight florence zurich)
    (directflight zurich home)
  )

  ; Goals:
  ; - All visiting days day1..day12 must be assigned (i.e., not unassigned).
  ; - Each visit city must be visited at least once (visited venice, florence, zurich).
  ; - The traveller must return home on the post-trip day13 and the auditor's returned-home reconciliation must be true.
  (:goal (and
    ; all visiting days have been consumed (exactly 12 visiting days used)
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3)) (not (unassigned day4))
    (not (unassigned day5)) (not (unassigned day6)) (not (unassigned day7)) (not (unassigned day8))
    (not (unassigned day9)) (not (unassigned day10)) (not (unassigned day11)) (not (unassigned day12))

    ; each city must be visited at least once
    (visited venice) (visited florence) (visited zurich)

    ; return-home reconciliation and final location on day13
    (returned-home)
    (at home day13)
  ))

  ; No metric specified; pure plan feasibility.
)