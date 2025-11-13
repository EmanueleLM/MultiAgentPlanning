(define (problem trip-9days)
  (:domain trip-assignments)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    n0 n1 n2 n3 - num
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

    (first-day d1)
    (last-day d9)

    (workshop-day d1)
    (workshop-day d2)
    (workshop-day d3)

    (direct prague vienna)
    (direct vienna prague)
    (direct vienna porto)
    (direct porto vienna)

    (current d1)

    (current-count-prague n0)
    (current-count-vienna n0)
    (current-count-porto n0)

    (next-num n0 n1)
    (next-num n1 n2)
    (next-num n2 n3)
  )
  (:goal (and
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (current-count-prague n3)
    (current-count-vienna n3)
    (current-count-porto n3)
  ))
)