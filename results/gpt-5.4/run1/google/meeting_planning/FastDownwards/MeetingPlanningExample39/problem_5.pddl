(define (problem meetingplanningexample39_problem)
  (:domain meetingplanningexample39)

  (:objects
    t0900 t0911 t1634 t1645 t1745 t1845 t1945 t2045 t2145 - time
  )

  (:init
    (at fishermans_wharf)
    (free)
    (current t0900)

    (next t0900 t0911)
    (next t0911 t1634)
    (next t1634 t1645)
    (next t1645 t1745)
    (next t1745 t1845)
    (next t1845 t1945)
    (next t1945 t2045)
    (next t2045 t2145)

    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)

    (available_stephanie t1645)
    (available_stephanie t1745)
    (available_stephanie t1845)
    (available_stephanie t1945)
    (available_stephanie t2045)
    (available_stephanie t2145)
  )

  (:goal
    (and
      (met_stephanie)
      (at nob_hill)
      (current t1845)
      (free)
    )
  )
)