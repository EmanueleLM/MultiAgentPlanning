(define (problem monday-60)
  (:domain meeting60)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ; Common availability intersection for all participants (derived from provided data)
    (free thomas s1100)
    (free dylan  s1100)
    (free jerry  s1100)

    (free thomas s1430)
    (free dylan  s1430)
    (free jerry  s1430)

    (free thomas s1500)
    (free dylan  s1500)
    (free jerry  s1500)

    (free thomas s1530)
    (free dylan  s1530)
    (free jerry  s1530)
  )
  (:goal (and
    (scheduled)
  ))
)