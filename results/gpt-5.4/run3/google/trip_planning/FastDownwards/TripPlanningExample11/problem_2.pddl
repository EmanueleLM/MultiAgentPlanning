(define (problem tripplanningexample11)
  (:domain tripplanningexample11)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
    vienna_block vilnius_block valencia_block - block
  )

  (:init
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)

    (assigned vienna_block vienna)
    (assigned vilnius_block vilnius)
    (assigned valencia_block valencia)

    (block_length_5 vienna_block)
    (block_length_5 vilnius_block)
    (block_length_7 valencia_block)

    (current_day day_1)
    (at vienna)
  )

  (:goal
    (and
      (finished vienna_block)
      (finished vilnius_block)
      (finished valencia_block)
      (visited valencia day_9)
      (visited valencia day_15)
    )
  )
)