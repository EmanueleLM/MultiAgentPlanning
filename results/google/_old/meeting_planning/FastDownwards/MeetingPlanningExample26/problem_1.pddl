(define (problem integrated-meet-problem)
  (:domain integrated-meeting)
  (:objects
    traveler sarah - agent
    richmond presidio - location

    ;; start times: 795 .. 810 (13:15 .. 13:30)
    s795 s796 s797 s798 s799 s800 s801 s802 s803 s804 s805 s806 s807 s808 s809 s810 - starttime

    ;; durations: 105 .. 120 minutes
    d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 d116 d117 d118 d119 d120 - duration
  )

  (:init
    ;; initial locations
    (at traveler richmond)
    (at sarah presidio)

    ;; total-cost starts at 0
    (= (total-cost) 0)

    ;; depart_ok: traveler starting at 540 can depart to reach any start in s795..s810 (precomputed)
    (depart_ok s795) (depart_ok s796) (depart_ok s797) (depart_ok s798)
    (depart_ok s799) (depart_ok s800) (depart_ok s801) (depart_ok s802)
    (depart_ok s803) (depart_ok s804) (depart_ok s805) (depart_ok s806)
    (depart_ok s807) (depart_ok s808) (depart_ok s809) (depart_ok s810)

    ;; can_meet pairs: start s + duration d must finish by 915 (15:15).
    ;; s795: allowed d105..d120
    (can_meet s795 d105) (can_meet s795 d106) (can_meet s795 d107) (can_meet s795 d108)
    (can_meet s795 d109) (can_meet s795 d110) (can_meet s795 d111) (can_meet s795 d112)
    (can_meet s795 d113) (can_meet s795 d114) (can_meet s795 d115) (can_meet s795 d116)
    (can_meet s795 d117) (can_meet s795 d118) (can_meet s795 d119) (can_meet s795 d120)

    ;; s796: allowed d105..d119
    (can_meet s796 d105) (can_meet s796 d106) (can_meet s796 d107) (can_meet s796 d108)
    (can_meet s796 d109) (can_meet s796 d110) (can_meet s796 d111) (can_meet s796 d112)
    (can_meet s796 d113) (can_meet s796 d114) (can_meet s796 d115) (can_meet s796 d116)
    (can_meet s796 d117) (can_meet s796 d118) (can_meet s796 d119)

    ;; s797: allowed d105..d118
    (can_meet s797 d105) (can_meet s797 d106) (can_meet s797 d107) (can_meet s797 d108)
    (can_meet s797 d109) (can_meet s797 d110) (can_meet s797 d111) (can_meet s797 d112)
    (can_meet s797 d113) (can_meet s797 d114) (can_meet s797 d115) (can_meet s797 d116)
    (can_meet s797 d117) (can_meet s797 d118)

    ;; s798: allowed d105..d117
    (can_meet s798 d105) (can_meet s798 d106) (can_meet s798 d107) (can_meet s798 d108)
    (can_meet s798 d109) (can_meet s798 d110) (can_meet s798 d111) (can_meet s798 d112)
    (can_meet s798 d113) (can_meet s798 d114) (can_meet s798 d115) (can_meet s798 d116)
    (can_meet s798 d117)

    ;; s799: allowed d105..d116
    (can_meet s799 d105) (can_meet s799 d106) (can_meet s799 d107) (can_meet s799 d108)
    (can_meet s799 d109) (can_meet s799 d110) (can_meet s799 d111) (can_meet s799 d112)
    (can_meet s799 d113) (can_meet s799 d114) (can_meet s799 d115) (can_meet s799 d116)

    ;; s800: allowed d105..d115
    (can_meet s800 d105) (can_meet s800 d106) (can_meet s800 d107) (can_meet s800 d108)
    (can_meet s800 d109) (can_meet s800 d110) (can_meet s800 d111) (can_meet s800 d112)
    (can_meet s800 d113) (can_meet s800 d114) (can_meet s800 d115)

    ;; s801: allowed d105..d114
    (can_meet s801 d105) (can_meet s801 d106) (can_meet s801 d107) (can_meet s801 d108)
    (can_meet s801 d109) (can_meet s801 d110) (can_meet s801 d111) (can_meet s801 d112)
    (can_meet s801 d113) (can_meet s801 d114)

    ;; s802: allowed d105..d113
    (can_meet s802 d105) (can_meet s802 d106) (can_meet s802 d107) (can_meet s802 d108)
    (can_meet s802 d109) (can_meet s802 d110) (can_meet s802 d111) (can_meet s802 d112)
    (can_meet s802 d113)

    ;; s803: allowed d105..d112
    (can_meet s803 d105) (can_meet s803 d106) (can_meet s803 d107) (can_meet s803 d108)
    (can_meet s803 d109) (can_meet s803 d110) (can_meet s803 d111) (can_meet s803 d112)

    ;; s804: allowed d105..d111
    (can_meet s804 d105) (can_meet s804 d106) (can_meet s804 d107) (can_meet s804 d108)
    (can_meet s804 d109) (can_meet s804 d110) (can_meet s804 d111)

    ;; s805: allowed d105..d110
    (can_meet s805 d105) (can_meet s805 d106) (can_meet s805 d107) (can_meet s805 d108)
    (can_meet s805 d109) (can_meet s805 d110)

    ;; s806: allowed d105..d109
    (can_meet s806 d105) (can_meet s806 d106) (can_meet s806 d107) (can_meet s806 d108)
    (can_meet s806 d109)

    ;; s807: allowed d105..d108
    (can_meet s807 d105) (can_meet s807 d106) (can_meet s807 d107) (can_meet s807 d108)

    ;; s808: allowed d105..d107
    (can_meet s808 d105) (can_meet s808 d106) (can_meet s808 d107)

    ;; s809: allowed d105..d106
    (can_meet s809 d105) (can_meet s809 d106)

    ;; s810: allowed d105 only
    (can_meet s810 d105)
  )

  ;; Goal: meeting must be achieved
  (:goal (met))

  ;; Metric: minimize total-cost. We encode meeting benefit as negative cost attached to meeting actions
  (:metric minimize (total-cost))
)