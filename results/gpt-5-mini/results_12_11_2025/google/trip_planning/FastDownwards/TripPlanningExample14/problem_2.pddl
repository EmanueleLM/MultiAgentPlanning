(define (problem trip-10days-lyon-frankfurt-krakow)
  (:domain travel-lyon-frankfurt-krakow)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    lyon frankfurt krakow - city
  )

  (:init
    ;; timeline order
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; direct flight edges (bidirectional)
    (edge lyon frankfurt) (edge frankfurt lyon)
    (edge frankfurt krakow) (edge krakow frankfurt)

    ;; initial timeline cursor and initial assignment (start in lyon on day 1)
    (current d1)
    (assigned d1 lyon)

    ;; days not yet assigned (days 2..10)
    (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)

    ;; record that lyon is already visited/spent in because day1 is assigned to lyon
    (visited lyon)
    (spent_in lyon)
  )

  (:goal (and
    ;; exact day-by-day assignments (concrete target itinerary)
    (assigned d1 lyon)
    (assigned d2 lyon)
    (assigned d3 lyon)
    (assigned d4 lyon)
    (assigned d5 lyon)
    (assigned d6 lyon)
    (assigned d7 frankfurt)
    (assigned d8 krakow)
    (assigned d9 krakow)
    (assigned d10 krakow)

    ;; attendance requirement: be present (and mark attendance) in Krakow on days 8-10
    (attend d8) (attend d9) (attend d10)

    ;; visit-all-cities requirement
    (visited lyon) (visited frankfurt) (visited krakow)

    ;; ensure at least one full day was spent in each city
    (spent_in lyon) (spent_in frankfurt) (spent_in krakow)

    ;; final timeline cursor and final location
    (current d10)
  ))

  ;; Note: the domain actions (stay, fly) advance the timeline from d1 to d10 and create the
  ;; required (assigned ...) facts. The mark_attend action must be applied for d8,d9,d10 after
  ;; those days are assigned to satisfy the attend(d) goals.

)