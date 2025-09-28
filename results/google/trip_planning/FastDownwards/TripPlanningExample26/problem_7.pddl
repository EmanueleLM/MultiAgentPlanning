(define (problem trip16)
  (:domain trip_planning)
  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )
  (:init
    (day-next d1 d2) (day-next d2 d3) (day-next d3 d4) (day-next d4 d5)
    (day-next d5 d6) (day-next d6 d7) (day-next d7 d8) (day-next d8 d9)
    (day-next d9 d10) (day-next d10 d11) (day-next d11 d12) (day-next d12 d13)
    (day-next d13 d14) (day-next d14 d15) (day-next d15 d16)
    (direct berlin reykjavik)
    (direct reykjavik berlin)
    (direct porto berlin)
    (direct berlin porto)
    (at porto d1)
    (meeting-window d12)
    (meeting-window d13)
    (meeting-window d14)
    (meeting-window d15)
    (meeting-window d16)
  )
  (:goal
    (and
      (at porto d1) (at porto d2) (at porto d3) (at porto d4) (at porto d5)
      (at berlin d6) (at berlin d7) (at berlin d8) (at berlin d9) (at berlin d10) (at berlin d11)
      (at reykjavik d12) (at reykjavik d13) (at reykjavik d14) (at reykjavik d15) (at reykjavik d16)
      (meeting-scheduled)
    )
  )
)