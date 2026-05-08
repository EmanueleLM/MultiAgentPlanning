(define (problem travel-itinerary-10day)
  (:domain travel-domain)
  (:objects
    traveler - person
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ; day succession (explicit timeline)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ; initial location: arrival in Lyon on Day 1
    (at traveler lyon d1)

    ; direct flight legs (both directions where applicable)
    (flight lyon frankfurt)
    (flight frankfurt lyon)
    (flight frankfurt krakow)
    (flight krakow frankfurt)

    ; allowed same-calendar-day two-leg transfer sequences (Lyon -> Frankfurt -> Krakow)
    (two_leg lyon frankfurt krakow)

    ; show occurs in Krakow on Days 8-10
    (show-in krakow d8)
    (show-in krakow d9)
    (show-in krakow d10)
  )

  (:goal (and
    ; enforce 7 days in Lyon: Days 1..7
    (at traveler lyon d1)
    (at traveler lyon d2)
    (at traveler lyon d3)
    (at traveler lyon d4)
    (at traveler lyon d5)
    (at traveler lyon d6)
    (at traveler lyon d7)

    ; enforce 3 days in Krakow: Days 8..10
    (at traveler krakow d8)
    (at traveler krakow d9)
    (at traveler krakow d10)

    ; attend the show on days 8..10
    (attended d8)
    (attended d9)
    (attended d10)
  ))
)